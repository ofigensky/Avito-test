//
//  APICaller.swift
//  Avito test
//
//  Created by Gleb Glushok on 23.08.2022.
//

//import Foundation
//
//struct Constants {
//    static let apiURL = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
//}
//
//class APICaller {
//    
//    static let shared = APICaller()
//    
//    func parseJSON() {
//        
//        guard let url = URL(string: Constants.apiURL) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print(error)
//                return
//            }
//            
//            guard let data = data else { return }
//            
//            do {
//                let avito = try JSONDecoder().decode(Avito.self, from: data)
//                print(avito)
//            } catch {
//                print(error)
//            }
//            
//        }.resume()
//    }
//}
