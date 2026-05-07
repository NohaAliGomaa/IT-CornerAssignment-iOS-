//
//  Course.swift
//  Leany
//
//  Created by Ahmed Fareed on 06/05/2026.
//

import Foundation
struct Course : Identifiable {
    let id: Int
    let name: String
    let image: String
    let progress: Int
    let isCompleted: Bool
    let summary: String
}
