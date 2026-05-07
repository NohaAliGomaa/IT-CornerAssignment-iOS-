import Foundation
@MainActor
final class CourseDetailViewModel: ObservableObject {

    @Published var sections: [ModuleDto] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil   // ✅ ADD THIS

    private let repo = CourseDetailRepository()

    func load(courseId: Int) async {

        isLoading = true
        errorMessage = nil

        do {
            let result = try await repo.getCourseDetails(courseId: courseId)
            self.sections = result.flatMap { $0.modules }

        } catch {
            self.errorMessage = error.localizedDescription   // ✅ IMPORTANT
        }

        isLoading = false
    }
}
