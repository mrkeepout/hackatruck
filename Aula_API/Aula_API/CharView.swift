import SwiftUI

struct CharView: View {
    let personagem: Personagem
    
    var body: some View {
        VStack(spacing: 20) {
            if let imageUrlString = personagem.image,
               let url = URL(string: imageUrlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                    default:
                        ProgressView()
                    }
                }
            }

            Text(personagem.name ?? "Sem nome")
                .font(.title)
                .bold()
            
            Text("Casa: \(personagem.house ?? "Desconhecida")")
            Text("Ancestralidade: \(personagem.ancestry ?? "Desconhecida")")
            Text("Espécie: \(personagem.species ?? "Desconhecida")")
            Text("Bruxo: \(personagem.wizard!)")

            Spacer()
        }
        .padding()
    }
}
