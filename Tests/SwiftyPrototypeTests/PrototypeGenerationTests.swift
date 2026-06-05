import XCTest
import SwiftyPrototype

class PrototypeMethodTests: XCTestCase {

    override class func setUp() {
        SwiftyMockyTestObserver.setup()
    }

    func test_voidMethod_invocationTracking() {
        let proto = SimpleServicePrototype()

        Verify(proto, 0, .execute())
        proto.execute()
        Verify(proto, 1, .execute())
        proto.execute()
        proto.execute()
        Verify(proto, 3, .execute())
    }

    func test_methodReturningString_stubbing() {
        let proto = SimpleServicePrototype()

        Given(proto, .fetch(id: .value("x"), willReturn: "result-x"))
        Given(proto, .fetch(id: .any, willReturn: "fallback"))

        XCTAssertEqual(proto.fetch(id: "x"), "result-x")
        XCTAssertEqual(proto.fetch(id: "y"), "fallback")

        Verify(proto, 2, .fetch(id: .any))
        Verify(proto, 1, .fetch(id: .value("x")))
    }

    func test_methodWithMultipleParams_stubbing() {
        let proto = SimpleServicePrototype()

        Given(proto, .compute(a: .value(3), b: .value(4), willReturn: 7))
        Given(proto, .compute(a: .any, b: .any, willReturn: 0))

        XCTAssertEqual(proto.compute(a: 3, b: 4), 7)
        XCTAssertEqual(proto.compute(a: 1, b: 2), 0)
    }

    func test_perform_closureExecutedWithArguments() {
        let proto = SimpleServicePrototype()
        var capturedId: String?

        Perform(proto, .fetch(id: .any, perform: { id in capturedId = id }))
        Given(proto, .fetch(id: .any, willReturn: ""))

        _ = proto.fetch(id: "hello")
        XCTAssertEqual(capturedId, "hello")
    }

    func test_transformer_overloadedMethod() {
        let proto = TransformerPrototype()

        Given(proto, .transform(.value(42), willReturn: "forty-two"))
        Given(proto, .transform(.value("7"), willReturn: 7))

        XCTAssertEqual(proto.transform(42), "forty-two")
        XCTAssertEqual(proto.transform("7"), 7)

        Verify(proto, 1, .transform(.value(42)))
        Verify(proto, 1, .transform(.value("7")))
    }
}

class PrototypePropertyTests: XCTestCase {

    override class func setUp() {
        SwiftyMockyTestObserver.setup()
    }

    func test_readWriteProperty() {
        let proto = DataStorePrototype()

        proto.name = "store-a"
        XCTAssertEqual(proto.name, "store-a")

        proto.name = "store-b"
        XCTAssertEqual(proto.name, "store-b")
    }

    func test_getOnlyProperty_stubbedViaGiven() {
        let proto = DataStorePrototype()

        Given(proto, .isReady(getter: false))
        XCTAssertFalse(proto.isReady)

        Given(proto, .isReady(getter: true))
        XCTAssertTrue(proto.isReady)
    }

    func test_methodReturningOptional_nilWhenUnstubbed() {
        let proto = DataStorePrototype()

        XCTAssertNil(proto.load())

        Given(proto, .load(willReturn: "payload"))
        XCTAssertEqual(proto.load(), "payload")
    }

    func test_voidMethod_invocationsTracked() {
        let proto = DataStorePrototype()

        Verify(proto, 0, .save(.any))
        proto.save("a")
        proto.save("b")
        Verify(proto, 2, .save(.any))
        Verify(proto, 1, .save(.value("a")))
    }
}
