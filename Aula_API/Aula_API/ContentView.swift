import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack{
            
            //Imagem de fundo
            Image("hp-back")
                //.resizable()
                .scaledToFill()
                .overlay(Color.vermelho)
                .opacity(0.8)
            
            Spacer()
            //Construcao do app
            VStack {
                Spacer()
                //Imagem topo
                Image("gryffindor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
                ZStack{
                    //Lista de personagens
                    Rectangle()
                        .fill(.vermelho)
                        .frame(height: 500)
                    //Scrollview dos personagens
                    ScrollView{
                        ForEach(viewModel.persona){ index in
                            HStack{
                                if let url = URL(string: index.image!), ((index.image?.isEmpty) == nil) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            Circle()
                                                .strokeBorder(style: StrokeStyle(lineWidth: 4))

                                                .overlay(
                                                    image
                                                        .resizable()
                                                        .scaledToFit()
                                            )
                                        case .failure(_):
                                            Text("Erro ao carregar imagem")
                                        case .empty:
                                            ProgressView()
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                }
                                Image(index.image!)
                                Text(index.name!)
                            }
                        }
                    }
                }
            }
            
        }//zstack
        .padding()
        .onAppear {
            viewModel.fetch()
        }
    }//view
}

#Preview {
    ContentView()
}
