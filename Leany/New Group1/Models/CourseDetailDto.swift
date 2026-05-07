//
//  CourseDetailDto.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation
struct CourseDetailDto: Decodable {
    let name: String
    let modules: [ModuleDto]
}
