//
//  CourseRepository .swift
//  Leany
//
//  Created by Ahmed Fareed on 07/05/2026.
//

import Foundation
final class CourseRepository {

    func getCourses() async throws -> [Course] {

        guard let request = RequestBuilder.build(
            function: "core_enrol_get_users_courses",
            params: ["userid": 1003]
        ) else {
            throw URLError(.badURL)
        }

        let dtos: [CourseDTO] = try await NetworkService.shared.execute(request)

        return dtos.map { $0.toDomain() }
    }
}
