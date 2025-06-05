import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            // Imagem de fundo
            Image("hp-back")
                .resizable()
                .scaledToFill()
                .overlay(Color.vermelho.opacity(0.8))
                .ignoresSafeArea()
            
            
            VStack {
                Divider()
                // Imagem topo
                Image("gryffindor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Divider()
                // Lista de personagens
                ZStack {
                    
                    Rectangle()
                        .fill(Color.vermelho)
                        .frame(height: 620)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .ignoresSafeArea()
                Spacer()
                    
                    ScrollView {
                        VStack{
                            ForEach(viewModel.persona) { personagem in
                                HStack(spacing: 26) {
                                    // AsyncImage com validação de URL
                                    if let imageUrlString = personagem.image,
                                       !imageUrlString.isEmpty,
                                       let url = URL(string: imageUrlString) {
                                        
                                        AsyncImage(url: url) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 100, height: 100)
                                                    .clipShape(Circle())
                                                    .overlay(Circle().stroke(Color.white))
                                            case .failure(_):
                                                Image(systemName: "xmark.octagon")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .foregroundColor(.red)
                                            case .empty:
                                                ProgressView()
                                                    .frame(width: 100, height: 100)
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                    } else {
                                        Image(systemName: "person.crop.circle.fill.badge.questionmark")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    // Nome do personagem
                                    Text(personagem.name ?? "Sem nome")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                        .padding(.top)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .sheet(item: $localSelecionadoSheet) { local in
            sheetview(local: local)
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
