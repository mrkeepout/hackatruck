import SwiftUI

struct AdicionarRemedios: View {
    @ObservedObject var viewModel: ViewModel

    @State private var nome = ""
    @State private var quantidade = ""
    @State private var datacomprado = ""
    @State private var datafinal = ""
    @State private var mensagem = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Adicionar Remédio")
                .font(.largeTitle)
                .bold()

            TextField("Nome", text: $nome)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Quantidade", text: $quantidade)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            TextField("Data de Compra (dd/mm/aaaa)", text: $datacomprado)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Validade (dd/mm/aaaa)", text: $datafinal)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Salvar") {
                viewModel.adicionarRemedio(
                    nome: nome,
                    quantidade: quantidade,
                    datacomprado: datacomprado,
                    datafinal: datafinal
                ) { sucesso in
                    if sucesso {
                        mensagem = "Remédio adicionado com sucesso!"
                        nome = ""
                        quantidade = ""
                        datacomprado = ""
                        datafinal = ""
                    } else {
                        mensagem = "Erro ao adicionar remédio."
                    }
                }
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Text(mensagem)
                .foregroundColor(.gray)
                .padding()

            Spacer()
        }
        .padding()
    }
}
