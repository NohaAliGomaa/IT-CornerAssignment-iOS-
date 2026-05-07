//
//  CourseDTO.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation
struct CourseDTO: Codable {
    let id: Int
    let shortname: String
    let fullname: String
    let displayname: String
    let enrolledusercount: Int
    let idnumber: String
    let visible: Int
    let summary: String
    let summaryformat: Int
    let format: String
    let courseimage: String
    let showgrades: Bool
    let lang: String
    let enablecompletion: Bool
    let completionhascriteria: Bool
    let completionusertracked: Bool
    let category: Int
    let progress: Int?
    let completed: Bool?
    let startdate: Int
    let enddate: Int
    let marker: Int
    let lastaccess: Int?
    let isfavourite: Bool
    let hidden: Bool
    let overviewfiles: [String]   // أو [AnyCodable] لو structure معقد
    let showactivitydates: Bool
    let showcompletionconditions: Bool
    let timemodified: Int
}
