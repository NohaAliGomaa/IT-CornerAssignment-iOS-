//
//  CourseDetailRepository.swift
//  Leany
//
//  Created by Ahmed Fareed on 07/05/2026.
//

import Foundation
final class CourseDetailRepository {

    func getCourseDetails(courseId: Int) async throws -> [CourseDetailDto]{

        guard let request = RequestBuilder.build(
            function: "core_course_get_contents",
            params: ["courseid": courseId]
        ) else { throw URLError(.badURL) }

        return try await NetworkService.shared.execute(request)
    }
}
