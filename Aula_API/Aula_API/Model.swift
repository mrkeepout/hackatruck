//
//  Model.swift
//  Aula_API
//
//  Created by Turma02-11 on 04/06/25.
//

import Foundation

struct Personagem: Codable, Identifiable {
    let id : String
    let name :  String?
    let surname :  String?
    let image:  String?
    let age :  String?
    let house: String?
    let ancestry: String?
    let wizard: Bool?
    let species: String?
    
}
