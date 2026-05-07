//
//  GradeDto.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation
struct GradeDto: Decodable {
    let itemname: String?
    let finalgrade: Double?
}

struct GradesResponse: Decodable {
    let usergrades: [UserGrade]
}

struct UserGrade: Decodable {
    let courseid: Int
    let grades: [GradeDto]
}
