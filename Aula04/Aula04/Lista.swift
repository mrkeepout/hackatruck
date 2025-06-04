//
//  Lista.swift
//  Aula04
//
//  Created by Turma02-11 on 30/05/25.
//

import SwiftUI

struct Lista: View {
    var body: some View {
        VStack{
            NavigationLink(destination: item1){
                Text("Indo para item 1")
            }
        }
    }
}

#Preview {
    Lista()
}
