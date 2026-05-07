//
//  CourseMapper.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation
extension CourseDTO {
    func toDomain() -> Course {
        return Course(
            id: id,
            name: displayname,
            image: courseimage,
            progress: progress ?? 0,
            isCompleted: completed ?? false,
            summary: summary
        )
    }
}
