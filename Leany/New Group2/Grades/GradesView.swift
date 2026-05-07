import SwiftUI

struct GradesView: View {

    @StateObject var vm = GradesViewModel()

    var body: some View {

       

            ZStack {

                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                // MARK: Loading
                if vm.isLoading {

                    ProgressView("Loading Grades...")
                        .scaleEffect(1.2)

                }

                // MARK: Error
                else if let error = vm.errorMessage {

                    VStack(spacing: 16) {

                        Image("error")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)

                        Text(error)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }

                // MARK: Empty
                else if vm.grades.isEmpty {

                    VStack(spacing: 16) {

                        Image("empty")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)

                        Text("No Grades Found")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }

                // MARK: Content
                else {

                    List(vm.grades, id: \.itemname) { grade in

                        VStack(alignment: .leading, spacing: 6) {

                            Text(grade.itemname ?? "No name")
                                .font(.headline)

                            Text("Grade: \(grade.finalgrade ?? 0)")
                                .foregroundColor(.orange)
                                .fontWeight(.semibold)
                        }
                        .padding(.vertical, 6)
                    }
                    .listStyle(.plain)
                }
        }
        .task {
            await vm.load()
        }
    }
}
