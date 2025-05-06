//import SwiftUI
//import PokemonTCGSDKSwift
//
//struct testAPIView: View {
//    @State private var cardImageURL: URL?
//    @State private var errorMessage: String?
//
//    private let apiKey = "4a48a8c1-acd6-44b5-95c0-5d20dece4aa3"
//
//    var body: some View {
//        VStack {
//            if let url = cardImageURL {
//                AsyncImage(url: url) { phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                    case .success(let image):
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .padding()
//                    case .failure:
//                        Text("Failed to load image")
//                    @unknown default:
//                        EmptyView()
//                    }
//                }
//            } else if let error = errorMessage {
//                Text("Error: \(error)")
//                    .foregroundColor(.red)
//            } else {
//                ProgressView("Fetching Card...")
//            }
//        }
//        .task {
//            await fetchPikachuCard()
//        }
//    }
//
//    func fetchPikachuCard() async {
//        let tcg = PokemonTCG(apiKey: apiKey)
//
//        do {
//            let response = try await tcg.cardService.searchCard(query: "name:Pikachu", currentPage: 1, pageSize: 1)
//            if let firstCard = response.data.first, let url = URL(string: firstCard.images!.large) {
//                cardImageURL = url
//            } else {
//                errorMessage = "No Pikachu card found."
//            }
//        } catch {
//            errorMessage = error.localizedDescription
//        }
//    }
//}
//
//#Preview {
//    testAPIView()
//}
