import SwiftUI

struct ConsultarRemedios: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("Estoque de Remédios")
                .font(.largeTitle)
                .bold()
                .padding()

            if viewModel.remedio.isEmpty {
                Text("Carregando ou nenhum remédio encontrado.")
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
            } else {
                List(viewModel.remedio) { remedio in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(remedio.nome)
                            .font(.headline)
                        
                        Text("Quantidade: \(remedio.quantidade)")
                            .font(.subheadline)
                        
                        Text("Comprado em: \(remedio.datacomprado)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Vence em: \(remedio.datafinal)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
