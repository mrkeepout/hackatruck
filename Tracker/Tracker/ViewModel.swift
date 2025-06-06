//
//  ViewModel.swift
//  Aula_API
//
//  Created by Turma02-11 on 04/06/25.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var remedio : [Remedios] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.90:1880/consultarRemedio" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Remedios].self, from: data)
                
                DispatchQueue.main.async {
                    self?.remedio = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
        
    }
    
    func adicionarRemedio(nome: String, quantidade: String, datacomprado: String, datafinal: String, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://192.168.128.90:1880/adicionarRemedio") else {
            completion(false)
            return
        }

        let remedio = [
            "nome": nome,
            "quantidade": quantidade,
            "datacomprado": datacomprado,
            "datafinal": datafinal
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: remedio) else {
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { _, response, error in
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }.resume()
    }
}
