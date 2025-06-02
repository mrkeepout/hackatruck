//
//  Rosa.swift
//  Aula04
//
//  Created by Turma02-11 on 30/05/25.
//

import SwiftUI

struct Rosa: View {
    var body: some View {
        VStack{
            ZStack {
                Color.pink
                    .ignoresSafeArea()
                
                Circle()
                    .fill(Color.black)
                    .frame(width: 300, height: 300)
                    .overlay(
                        Image(systemName: "paintbrush")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 240)
                            .foregroundColor(.pink)
                    )
            }//zstack
            Spacer()
            Rectangle()
                .fill(Color.white)
                .frame(height: 0)
                .edgesIgnoringSafeArea(.bottom)
        }//vstack
    }//view

}//view

#Preview {
    Rosa()
}
