//
//  ContentView.swift
//  Aula04
//
//  Created by Turma02-11 on 30/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Rosa()
                    .tabItem{
                        Label("Rosa", systemImage: "paintbrush")
                        }
                Azul()
                    .tabItem{
                        Label("Azul", systemImage: "paintbrush.pointed")
                        }
                Cinza()
                    .tabItem{
                        Label("Cinza", systemImage: "paintpalette")
                        }
                Lista()
                    .tabItem{
                        Label("Lista", systemImage: "list.bullet")
                        }
                
            }//tabview
        }//zstack
    }//view
}

#Preview {
    ContentView()
}
