//
//  CourseDetailView.swift
//  Leany
//

import SwiftUI

struct CourseDetailView: View {

    let courseId: Int

    @StateObject var vm = CourseDetailViewModel()

    var body: some View {

        

            ZStack {

                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                // MARK: Loading

                if vm.isLoading {

                    VStack(spacing: 16) {

                        ProgressView()
                            .scaleEffect(1.5)

                        Text("Loading Course...")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }

                // MARK: Error State

                else if let error = vm.errorMessage {

                    VStack(spacing: 20) {

                        Image("error")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 220)

                        Text(error)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                        Button("Retry") {

                            Task {
                                await vm.load(courseId: courseId)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                        .padding(.horizontal, 40)
                    }
                }

                // MARK: Empty State

                else if vm.sections.isEmpty {

                    VStack(spacing: 20) {

                        Image("empty")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 220)

                        Text("No Sections Found")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                }

                // MARK: Content

                else {

                    ScrollView {

                        LazyVStack(spacing: 16) {

                            ForEach(vm.sections, id: \.name) { section in

                                VStack(alignment: .leading, spacing: 10) {

                                    Text(section.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(18)
                                .shadow(
                                    color: .black.opacity(0.06),
                                    radius: 6,
                                    x: 0,
                                    y: 3
                                )
                            }

                            NavigationLink(destination: GradesView()) {

                                Text("View Grades")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(16)
                            }
                            .padding(.top)
                        }
                        .padding()
                    }
                }
           
        }
        .task {
            await vm.load(courseId: courseId)
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {

    static var previews: some View {

        CourseDetailView(courseId: 1003)
    }
}
