import SwiftUI

struct CoursesView: View {

    @StateObject var vm = CoursesViewModel()

    var body: some View {

        NavigationView {

            ScrollView {

                LazyVStack(spacing: 16) {

                    if vm.isLoading {

                        ProgressView()
                            .padding(.top, 40)

                    } else {

                        ForEach(vm.courses) { course in

                            NavigationLink(
                                destination: CourseDetailView(courseId: course.id)
                            ) {

                                CourseCard(course: course)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Courses")
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .task {
            await vm.load()
        }
    }
}

struct CourseCard: View {

    let course: Course

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            // MARK: Course Image

            AsyncImage(url: URL(string: course.image)) { image in

                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {

                ProgressView()
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .clipped()

            // MARK: Course Info

            VStack(alignment: .leading, spacing: 8) {

                Text(course.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)

                HStack {

                    Text("Progress")

                    Spacer()

                    Text("\(course.progress)%")
                        .fontWeight(.bold)
                }
                .font(.subheadline)
                .foregroundColor(Color.orange)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.orange.opacity(0.15))
                .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}
