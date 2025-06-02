//
//  Azul.swift
//  Aula04
//
//  Created by Turma02-11 on 30/05/25.
//

import SwiftUI

struct Azul: View {
    var body: some View {
        VStack{
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 300, height: 300)
                    .overlay(
                        Image(systemName: "paintbrush.pointed")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 220)
                            .foregroundColor(.blue)
                    )
            }//zstack
            Spacer()
            Rectangle()
                .fill(Color.white)
                .frame(height: 0)
                .edgesIgnoringSafeArea(.bottom)
        }//vstack
    }
}

#Preview {
    Azul()
}
