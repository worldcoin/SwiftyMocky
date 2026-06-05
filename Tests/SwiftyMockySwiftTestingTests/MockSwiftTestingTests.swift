import Testing
import SwiftyMocky
import Foundation

@Suite("Mock method stubs")
struct MockMethodSuite {

    @Test func voidMethod_invocationTracking() {
        let mock = STSimpleServiceMock()

        Verify(mock, 0, .execute())
        mock.execute()
        Verify(mock, 1, .execute())
        mock.execute()
        mock.execute()
        Verify(mock, 3, .execute())
    }

    @Test func methodReturningString_parameterMatching() {
        let mock = STSimpleServiceMock()

        Given(mock, .fetch(id: .value("x"), willReturn: "result-x"))
        Given(mock, .fetch(id: .any, willReturn: "fallback"))

        #expect(mock.fetch(id: "x") == "result-x")
        #expect(mock.fetch(id: "y") == "fallback")

        Verify(mock, 2, .fetch(id: .any))
        Verify(mock, 1, .fetch(id: .value("x")))
    }

    @Test func multipleParams_stubbing() {
        let mock = STSimpleServiceMock()

        Given(mock, .compute(a: .value(3), b: .value(4), willReturn: 7))
        Given(mock, .compute(a: .any, b: .any, willReturn: 0))

        #expect(mock.compute(a: 3, b: 4) == 7)
        #expect(mock.compute(a: 1, b: 2) == 0)
    }

    @Test func perform_closureReceivesArgument() {
        let mock = STSimpleServiceMock()
        var capturedId: String?

        Perform(mock, .fetch(id: .any, perform: { id in capturedId = id }))
        Given(mock, .fetch(id: .any, willReturn: ""))

        _ = mock.fetch(id: "hello")
        #expect(capturedId == "hello")
    }

    @Test func overloadedMethod_distinguishedByType() {
        let mock = STTransformerMock()

        Given(mock, .transform(.value(42), willReturn: "forty-two"))
        Given(mock, .transform(.value("7"), willReturn: 7))

        #expect(mock.transform(42) == "forty-two")
        #expect(mock.transform("7") == 7)

        Verify(mock, 1, .transform(.value(42)))
        Verify(mock, 1, .transform(.value("7")))
    }
}

@Suite("Mock property access")
struct MockPropertySuite {

    @Test func readWriteProperty() {
        let mock = STDataStoreMock()

        mock.name = "store-a"
        #expect(mock.name == "store-a")

        mock.name = "store-b"
        #expect(mock.name == "store-b")
    }

    @Test func getOnlyProperty_stubbedViaGiven() {
        let mock = STDataStoreMock()

        Given(mock, .isReady(getter: false))
        #expect(mock.isReady == false)

        Given(mock, .isReady(getter: true))
        #expect(mock.isReady == true)
    }

    @Test func optionalReturn_nilWhenUnstubbed() {
        let mock = STDataStoreMock()

        #expect(mock.load() == nil)

        Given(mock, .load(willReturn: "payload"))
        #expect(mock.load() == "payload")
    }

    @Test func voidMethod_invocationsTracked() {
        let mock = STDataStoreMock()

        Verify(mock, 0, .save(.any))
        mock.save("a")
        mock.save("b")
        Verify(mock, 2, .save(.any))
        Verify(mock, 1, .save(.value("a")))
    }
}

@Suite("Verify failure messages via Issue.record")
struct VerifyFailureSuite {

    @Test func verify_exactly_n_not_met() {
        let mock = STSimpleServiceMock()

        withKnownIssue {
            Verify(mock, 1, .execute())
        } matching: { issue in
            issue.comments.first?.rawValue == "Expected: exactly 1 invocations of `.execute()`, but was: 0."
        }
    }

    @Test func verify_never_violated() {
        let mock = STSimpleServiceMock()
        mock.execute()

        withKnownIssue {
            Verify(mock, .never, .execute())
        } matching: { issue in
            issue.comments.first?.rawValue == "Expected: none invocations of `.execute()`, but was: 1."
        }
    }

    @Test func verify_moreOrEqual_not_met() {
        let mock = STSimpleServiceMock()

        withKnownIssue {
            Verify(mock, .execute())
        } matching: { issue in
            issue.comments.first?.rawValue == "Expected: more than or equal to 1 invocations of `.execute()`, but was: 0."
        }
    }

}

@Suite("Swift Testing integration — Issue.record paths")
struct SwiftTestingIntegrationSuite {

    @Test func xctMockyAssert_recordsIssue_withExactMessage() {
        withKnownIssue {
            MockyAssert(false, "sentinel failure")
        } matching: { issue in
            issue.comments.first?.rawValue == "sentinel failure"
        }
    }

    @Test func xctMockyAssert_noIssue_whenExpressionTrue() {
        // Must not record any issue — if it does the test fails
        MockyAssert(true, "should not appear")
    }

    @Test func xctMockyAssert_sourceLocation_carriesFileAndLine() {
        let expectedFileID = "SwiftyMockySwiftTestingTests/MockSwiftTestingTests.swift"
        let expectedLine: UInt = 42
        withKnownIssue {
            MockyAssert(false, "location check", fileID: expectedFileID, line: expectedLine)
        } matching: { issue in
            issue.sourceLocation?.fileID == expectedFileID &&
            issue.sourceLocation?.line == Int(expectedLine)
        }
    }

    @Test func handleFatalError_recordsIssue_withExactMessage() {
        withKnownIssue {
            SwiftyMockyTestObserver.handleFatalError(
                message: "fatal sentinel",
                file: #file,
                fileID: #fileID,
                line: #line
            )
        } matching: { issue in
            issue.comments.first?.rawValue == "fatal sentinel"
        }
    }

    @Test func handleFatalError_sourceLocation_carriesFileAndLine() {
        let expectedFileID = "SwiftyMockySwiftTestingTests/MockSwiftTestingTests.swift"
        let expectedLine: UInt = 99
        withKnownIssue {
            SwiftyMockyTestObserver.handleFatalError(
                message: "fileID routing",
                file: #file,
                fileID: expectedFileID,
                line: expectedLine
            )
        } matching: { issue in
            issue.sourceLocation?.fileID == expectedFileID &&
            issue.sourceLocation?.line == Int(expectedLine)
        }
    }
}
