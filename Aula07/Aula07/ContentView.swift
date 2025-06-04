//
//  ContentView.swift
//  Aula07
//
//  Created by Gabriel on 04/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            //Imagem de fundo
            Image("hp-back")
                //.resizable()
                .scaledToFill()
                .overlay(Color.vermelho)
                .opacity(0.8)
            
            //Construcao do app
            VStack {
                Spacer()
                //Imagem topo
                Image("gryffindor")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
                //Lista de personagens
                Rectangle()
                    .fill(.vermelho)
                    .frame(height: 610)
                
            }
        }//zstack
        .padding()
    }//view
}

#Preview {
    ContentView()
}
