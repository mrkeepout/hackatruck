//
//  Cinza.swift
//  Aula04
//
//  Created by Turma02-11 on 30/05/25.
//

import SwiftUI

struct Cinza: View {
    var body: some View {
        VStack{
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 300, height: 300)
                    .overlay(
                        Image(systemName: "paintpalette")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 180)
                            .foregroundColor(.gray)
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
    Cinza()
}
