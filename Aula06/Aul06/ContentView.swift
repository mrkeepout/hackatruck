import SwiftUI
import MapKit

struct ContentView: View {
    
    struct Location: Hashable, Identifiable {
        let id = UUID()
        let nome: String
        let foto: String
        let descricao: String
        let latitude: Double
        let longitude: Double
        
        var coordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
    
    let locais: [Location] = [
        Location(nome: "Cristo Redentor", foto: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Christ_the_Redeemer_-_Cristo_Redentor.jpg", descricao: "Símbolo do Brasil, a estátua do Cristo Redentor fica no alto do Corcovado e oferece uma vista deslumbrante da cidade do Rio de Janeiro.", latitude: -22.9520561, longitude: -43.2105388),
        Location(nome: "Pelourinho", foto: "https://upload.wikimedia.org/wikipedia/commons/4/4b/Largo_do_Pelourinho_-_Salvador.JPG", descricao: "Centro histórico de Salvador, o Pelourinho é famoso por sua arquitetura colonial colorida, música ao vivo e rica herança afro-brasileira.", latitude: -12.9714, longitude: -38.5014),
        Location(nome: "Catedral de Brasília", foto: "https://upload.wikimedia.org/wikipedia/commons/0/06/Catedral_de_Brasilia_en_Brasil.JPG", descricao: "Obra-prima de Oscar Niemeyer, a catedral é conhecida por seu design futurista em forma de coroa e seus vitrais impressionantes.", latitude: -15.7989, longitude: -47.8645),
        Location(nome: "Praça da Liberdade", foto: "https://upload.wikimedia.org/wikipedia/commons/6/68/Pra%C3%A7a_da_Liberdade_-_Belo_Horizonte.jpg", descricao: "BUm dos principais pontos turísticos de BH, combina jardins históricos, arquitetura imponente e centros culturais ao redor.", latitude: -19.9320, longitude: -43.9378)
    ]

    
    @State private var localSelecionado: Location
    @State private var localSelecionadoSheet: Location? = nil
    @State private var position: MapCameraPosition
    
    init() {
        let defaultLocal = Location(nome: "Cristo Redentor", foto: "", descricao: "Rio de Janeiro", latitude: -22.9520561, longitude: -43.2105388)
        _localSelecionado = State(initialValue: defaultLocal)
        _position = State(initialValue: MapCameraPosition.region(
            MKCoordinateRegion(
                center: defaultLocal.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        ))
    }
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(locais) { local in
                    Annotation(local.nome, coordinate: local.coordinate) {
                        Button {
                            localSelecionadoSheet = local
                        } label: {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .ignoresSafeArea(edges: .all)
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color.pickers)
                        .cornerRadius(10)
                    
                    Picker("Selecione a cidade", selection: $localSelecionado) {
                        ForEach(locais, id: \.self) { local in
                            Text(local.nome).tag(local)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .tint(.black)
                }
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(width: 250, height: 50)
                        .foregroundColor(Color.pickers)
                        .cornerRadius(10)
                    
                    Text("Maravilhas do Mundo Moderno")
                        .padding()
                        .tint(.black)
                }
                .padding()
            }
            .onChange(of: localSelecionado) { novoLocal in
                withAnimation {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: novoLocal.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                        )
                    )
                }
            }
        }
        // AQUI está correto:
        .sheet(item: $localSelecionadoSheet) { local in
            sheetview(local: local)
        }
    }
}

    #Preview{
        ContentView()
    }

