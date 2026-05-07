//
//  GradesViewModel.swift
//  Leany
//
//  Created by Ahmed Fareed on 07/05/2026
import Foundation

@MainActor
final class GradesViewModel: ObservableObject {

    @Published var grades: [GradeDto] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    private let repo = GradeRepository()

    func load() async {

        isLoading = true
        errorMessage = nil

        do {
            grades = try await repo.getGrades()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
