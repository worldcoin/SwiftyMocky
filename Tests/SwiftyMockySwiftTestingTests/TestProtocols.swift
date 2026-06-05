import Foundation

//sourcery: AutoMockable
protocol STSimpleService {
    func execute()
    func fetch(id: String) -> String
    func compute(a: Int, b: Int) -> Int
}

//sourcery: AutoMockable
protocol STDataStore {
    var isReady: Bool { get }
    var name: String { get set }
    func save(_ value: String)
    func load() -> String?
}

//sourcery: AutoMockable
protocol STTransformer {
    func transform(_ input: Int) -> String
    func transform(_ input: String) -> Int?
}

//sourcery: AutoMockable
protocol STAuthenticator {
    func authenticate(for key: String) throws
    func authenticate() throws
}
