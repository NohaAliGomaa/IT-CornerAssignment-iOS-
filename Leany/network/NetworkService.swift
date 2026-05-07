//
//  NetworkService.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation
final class NetworkService {

    static let shared = NetworkService()
    private init() {}

    func execute<T: Decodable>(_ request: URLRequest) async throws -> T {

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse,
              200...299 ~= http.statusCode else {
            throw URLError(.badServerResponse)
        }
        print(String(data: data, encoding: .utf8)!)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
