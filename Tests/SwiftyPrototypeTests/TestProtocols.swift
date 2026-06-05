import Foundation

//sourcery: AutoMockable
protocol SimpleService {
    func execute()
    func fetch(id: String) -> String
    func compute(a: Int, b: Int) -> Int
}

//sourcery: AutoMockable
protocol DataStore {
    var isReady: Bool { get }
    var name: String { get set }
    func save(_ value: String)
    func load() -> String?
}

//sourcery: AutoMockable
protocol Transformer {
    func transform(_ input: Int) -> String
    func transform(_ input: String) -> Int?
}
