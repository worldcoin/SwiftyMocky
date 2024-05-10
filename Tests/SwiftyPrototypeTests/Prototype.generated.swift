// Generated using Sourcery 2.3.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyPrototype 4.2.0
// Required Sourcery: 1.8.0


import SwiftyPrototype
import Foundation


// MARK: - DataStore

open class DataStorePrototype: DataStore, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.fileID = fileID
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var fileID: String?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        self.file = file
        self.fileID = fileID
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var isReady: Bool {
		get {	addInvocation(.p_isReady_get); return __p_isReady ?? givenGetterValue(.p_isReady_get, "DataStorePrototype - stub value for isReady was not defined") }
	}
	private var __p_isReady: (Bool)?

    public var name: String {
		get {	addInvocation(.p_name_get); return __p_name ?? givenGetterValue(.p_name_get, "DataStorePrototype - stub value for name was not defined") }
		set {	addInvocation(.p_name_set(.value(newValue))); __p_name = newValue }
	}
	private var __p_name: (String)?





    open func save(_ value: String) {
        addInvocation(.m_save__value(Parameter<String>.value(`value`)))
		let perform = methodPerformValue(.m_save__value(Parameter<String>.value(`value`))) as? (String) -> Void
		perform?(`value`)
    }

    open func load() -> String? {
        addInvocation(.m_load)
		let perform = methodPerformValue(.m_load) as? () -> Void
		perform?()
		var __value: String? = nil
		do {
		    __value = try methodReturnValue(.m_load).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_save__value(Parameter<String>)
        case m_load
        case p_isReady_get
        case p_name_get
		case p_name_set(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_save__value(let lhsValue), .m_save__value(let rhsValue)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher), lhsValue, rhsValue, "_ value"))
				return Matcher.ComparisonResult(results)

            case (.m_load, .m_load): return .match
            case (.p_isReady_get,.p_isReady_get): return Matcher.ComparisonResult.match
            case (.p_name_get,.p_name_get): return Matcher.ComparisonResult.match
			case (.p_name_set(let left),.p_name_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<String>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_save__value(p0): return p0.intValue
            case .m_load: return 0
            case .p_isReady_get: return 0
            case .p_name_get: return 0
			case .p_name_set(let newValue): return newValue.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_save__value: return ".save(_:)"
            case .m_load: return ".load()"
            case .p_isReady_get: return "[get] .isReady"
            case .p_name_get: return "[get] .name"
			case .p_name_set: return "[set] .name"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func isReady(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_isReady_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func name(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_name_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func load(willReturn: String?...) -> MethodStub {
            return Given(method: .m_load, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func load(willProduce: (Stubber<String?>) -> Void) -> MethodStub {
            let willReturn: [String?] = []
			let given: Given = { return Given(method: .m_load, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func save(_ value: Parameter<String>) -> Verify { return Verify(method: .m_save__value(`value`))}
        public static func load() -> Verify { return Verify(method: .m_load)}
        public static var isReady: Verify { return Verify(method: .p_isReady_get) }
        public static var name: Verify { return Verify(method: .p_name_get) }
		public static func name(set newValue: Parameter<String>) -> Verify { return Verify(method: .p_name_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func save(_ value: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_save__value(`value`), performs: perform)
        }
        public static func load(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_load, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, fileID: fileID, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, fileID: fileID, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, fileID: fileID, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, fileID: self.fileID, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, fileID: self.fileID, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, fileID: String?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, fileID: fileID ?? self.fileID, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, fileID: String?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, fileID: fileID, line: line).count
    }
    private func givenGetterValue<ReturnType>(_ method: MethodType, _ message: String) -> ReturnType {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<ReturnType>(_ method: MethodType, _ message: String) -> ReturnType? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let fileID = self.fileID, let line = self.line else { return } // Let it fail if cannot handle gracefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, fileID: fileID, line: line)
    }
}

// MARK: - SimpleService

open class SimpleServicePrototype: SimpleService, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.fileID = fileID
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var fileID: String?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        self.file = file
        self.fileID = fileID
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
    }

    open func fetch(id: String) -> String {
        addInvocation(.m_fetch__id_id(Parameter<String>.value(`id`)))
		let perform = methodPerformValue(.m_fetch__id_id(Parameter<String>.value(`id`))) as? (String) -> Void
		perform?(`id`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_fetch__id_id(Parameter<String>.value(`id`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fetch(id: String). Use given")
			Failure("Stub return value not specified for fetch(id: String). Use given")
		}
		return __value
    }

    open func compute(a: Int, b: Int) -> Int {
        addInvocation(.m_compute__a_ab_b(Parameter<Int>.value(`a`), Parameter<Int>.value(`b`)))
		let perform = methodPerformValue(.m_compute__a_ab_b(Parameter<Int>.value(`a`), Parameter<Int>.value(`b`))) as? (Int, Int) -> Void
		perform?(`a`, `b`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_compute__a_ab_b(Parameter<Int>.value(`a`), Parameter<Int>.value(`b`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for compute(a: Int, b: Int). Use given")
			Failure("Stub return value not specified for compute(a: Int, b: Int). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute
        case m_fetch__id_id(Parameter<String>)
        case m_compute__a_ab_b(Parameter<Int>, Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match

            case (.m_fetch__id_id(let lhsId), .m_fetch__id_id(let rhsId)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher), lhsId, rhsId, "id"))
				return Matcher.ComparisonResult(results)

            case (.m_compute__a_ab_b(let lhsA, let lhsB), .m_compute__a_ab_b(let rhsA, let rhsB)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsA, rhs: rhsA, with: matcher), lhsA, rhsA, "a"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsB, rhs: rhsB, with: matcher), lhsB, rhsB, "b"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            case let .m_fetch__id_id(p0): return p0.intValue
            case let .m_compute__a_ab_b(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            case .m_fetch__id_id: return ".fetch(id:)"
            case .m_compute__a_ab_b: return ".compute(a:b:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func fetch(id: Parameter<String>, willReturn: String...) -> MethodStub {
            return Given(method: .m_fetch__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func compute(a: Parameter<Int>, b: Parameter<Int>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_compute__a_ab_b(`a`, `b`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func fetch(id: Parameter<String>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_fetch__id_id(`id`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func compute(a: Parameter<Int>, b: Parameter<Int>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_compute__a_ab_b(`a`, `b`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
        public static func fetch(id: Parameter<String>) -> Verify { return Verify(method: .m_fetch__id_id(`id`))}
        public static func compute(a: Parameter<Int>, b: Parameter<Int>) -> Verify { return Verify(method: .m_compute__a_ab_b(`a`, `b`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
        public static func fetch(id: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_fetch__id_id(`id`), performs: perform)
        }
        public static func compute(a: Parameter<Int>, b: Parameter<Int>, perform: @escaping (Int, Int) -> Void) -> Perform {
            return Perform(method: .m_compute__a_ab_b(`a`, `b`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, fileID: fileID, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, fileID: fileID, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, fileID: fileID, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, fileID: self.fileID, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, fileID: self.fileID, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, fileID: String?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, fileID: fileID ?? self.fileID, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, fileID: String?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, fileID: fileID, line: line).count
    }
    private func givenGetterValue<ReturnType>(_ method: MethodType, _ message: String) -> ReturnType {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<ReturnType>(_ method: MethodType, _ message: String) -> ReturnType? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let fileID = self.fileID, let line = self.line else { return } // Let it fail if cannot handle gracefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, fileID: fileID, line: line)
    }
}

// MARK: - Transformer

open class TransformerPrototype: Transformer, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.fileID = fileID
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var fileID: String?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        self.file = file
        self.fileID = fileID
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func transform(_ input: Int) -> String {
        addInvocation(.m_transform__input_1(Parameter<Int>.value(`input`)))
		let perform = methodPerformValue(.m_transform__input_1(Parameter<Int>.value(`input`))) as? (Int) -> Void
		perform?(`input`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_transform__input_1(Parameter<Int>.value(`input`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for transform(_ input: Int). Use given")
			Failure("Stub return value not specified for transform(_ input: Int). Use given")
		}
		return __value
    }

    open func transform(_ input: String) -> Int? {
        addInvocation(.m_transform__input_2(Parameter<String>.value(`input`)))
		let perform = methodPerformValue(.m_transform__input_2(Parameter<String>.value(`input`))) as? (String) -> Void
		perform?(`input`)
		var __value: Int? = nil
		do {
		    __value = try methodReturnValue(.m_transform__input_2(Parameter<String>.value(`input`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_transform__input_1(Parameter<Int>)
        case m_transform__input_2(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_transform__input_1(let lhsInput), .m_transform__input_1(let rhsInput)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsInput, rhs: rhsInput, with: matcher), lhsInput, rhsInput, "_ input"))
				return Matcher.ComparisonResult(results)

            case (.m_transform__input_2(let lhsInput), .m_transform__input_2(let rhsInput)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsInput, rhs: rhsInput, with: matcher), lhsInput, rhsInput, "_ input"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_transform__input_1(p0): return p0.intValue
            case let .m_transform__input_2(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_transform__input_1: return ".transform(_:)"
            case .m_transform__input_2: return ".transform(_:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func transform(_ input: Parameter<Int>, willReturn: String...) -> MethodStub {
            return Given(method: .m_transform__input_1(`input`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func transform(_ input: Parameter<String>, willReturn: Int?...) -> MethodStub {
            return Given(method: .m_transform__input_2(`input`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func transform(_ input: Parameter<Int>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_transform__input_1(`input`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func transform(_ input: Parameter<String>, willProduce: (Stubber<Int?>) -> Void) -> MethodStub {
            let willReturn: [Int?] = []
			let given: Given = { return Given(method: .m_transform__input_2(`input`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func transform(_ input: Parameter<Int>) -> Verify { return Verify(method: .m_transform__input_1(`input`))}
        public static func transform(_ input: Parameter<String>) -> Verify { return Verify(method: .m_transform__input_2(`input`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func transform(_ input: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_transform__input_1(`input`), performs: perform)
        }
        public static func transform(_ input: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_transform__input_2(`input`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, fileID: String = #fileID, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, fileID: fileID, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, fileID: fileID, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, fileID: fileID, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, fileID: self.fileID, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, fileID: self.fileID, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, fileID: String?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, fileID: fileID ?? self.fileID, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, fileID: String?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, fileID: fileID, line: line).count
    }
    private func givenGetterValue<ReturnType>(_ method: MethodType, _ message: String) -> ReturnType {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<ReturnType>(_ method: MethodType, _ message: String) -> ReturnType? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let fileID = self.fileID, let line = self.line else { return } // Let it fail if cannot handle gracefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, fileID: fileID, line: line)
    }
}

