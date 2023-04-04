import Foundation

struct Service {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }

    // Arquivo Service.swift

    func fetchList(of user: String, completion: @escaping ([Repository]?) -> Void) {
            
            let url = URL(string: "https://api.github.com/users/\(user)/repos")!

            network.performGet(url: url) { data in
                
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let repos = try jsonDecoder.decode([Repository].self, from: data)
                    completion(nil)
                } catch {
                    completion(nil)
                }
            }
        }
}
