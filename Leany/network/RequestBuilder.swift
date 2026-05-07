//
//  RequestBuilder.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation


struct RequestBuilder {

    static func build(function: String, params: [String: Int]) -> URLRequest? {

        var components = URLComponents(string: APIConfig.baseURL)

        var items: [URLQueryItem] = [
            URLQueryItem(name: "wstoken", value: APIConfig.token),
            URLQueryItem(name: "wsfunction", value: function),
            URLQueryItem(name: "moodlewsrestformat", value: APIConfig.format)
        ]

        params.forEach {
            items.append(URLQueryItem(name: $0.key, value: String($0.value)))
        }

        components?.queryItems = items

        guard let url = components?.url else { return nil }

        return URLRequest(url: url)
    }
}
