//
//  GradeRepository .swift
//  Leany
//
//  Created by Ahmed Fareed on 07/05/2026.
//

import Foundation
final class GradeRepository {

    func getGrades() async throws -> [GradeDto] {

        guard let request = RequestBuilder.build(
            function: "gradereport_user_get_grade_items",
            params: ["userid": 1003]
        ) else {
            throw URLError(.badURL)
        }

        let response: GradesResponse = try await NetworkService.shared.execute(request)

        return response.usergrades.flatMap { $0.grades }
    }
}
