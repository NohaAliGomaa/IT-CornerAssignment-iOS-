//
//  CoursesViewModel.swift
//  Leany
//
//  Created by Ahmed Fareed on 07/05/2026.
//

import Foundation
@MainActor
final class CoursesViewModel: ObservableObject {

    @Published var courses: [Course] = []
    @Published var isLoading = false
    @Published var error: String?

    private let repo = CourseRepository()

    func load() async {
        isLoading = true
        do {
            courses = try await repo.getCourses()
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
