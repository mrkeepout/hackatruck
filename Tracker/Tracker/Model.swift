//
//  Model.swift
//  Tracker
//
//  Created by Turma02-11 on 06/06/25.
//

import Foundation

struct Remedios: Codable, Identifiable {
    let id: String         // ← "id": "0"
    let nome: String       // ← "nome": "Paracetamol"
    let quantidade: String // ← "quantidade": "2"
    let datacomprado: String
    let datafinal: String

    enum CodingKeys: String, CodingKey {
        case id
        case nome
        case quantidade
        case datacomprado
        case datafinal
    }
}
