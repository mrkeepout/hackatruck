//
//  sheetview.swift
//  Aul06
//
//  Created by Turma02-11 on 03/06/25.
//

import SwiftUI

struct sheetview: View {
    let local: ContentView.Location
        @Environment(\.dismiss) var dismiss

        var body: some View {
            ZStack{
                Color.pickers
                            .ignoresSafeArea()

                VStack(spacing: 20) {
                    
                    ZStack{
                        
                        //
                        if let url = URL(string: local.foto), !local.foto.isEmpty {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .success(let image):
                                    Rectangle()
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
                        //
                    }
                    

                    
                    Text(local.nome)
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.brown)
                        .multilineTextAlignment(.center)
                    
                    Text(local.descricao)
                        .font(.body)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.brown)
                        )
                    
                    Spacer()
                    
                    Button("Fechar") {
                        dismiss()
                    }
                    .padding(.bottom)
                    
                }
                .padding()
                //.presentationDetents([.medium, .large])
            }
        }
    }

#Preview {
    sheetview(local: ContentView.Location(
        nome: "Cristo Redentor",
        foto: "https://upload.wikimedia.org/wikipedia/commons/4/4f/Christ_the_Redeemer_-_Cristo_Redentor.jpg",
        descricao: "Rio de Janeiro",
        latitude: -22.9520561,
        longitude: -43.2105388
    ))
}

