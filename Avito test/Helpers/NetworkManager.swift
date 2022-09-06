//
//  NetworkManager.swift
//  Avito test
//
//  Created by Gleb Glushok on 06.09.2022.
//

import Foundation

class NetworkManager {
    
    func parseJSON(completion: @escaping(_ companyModel: CompanyModel?) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
        do {
            let jsonData = try Data(contentsOf: url)
            let companyModel = try JSONDecoder().decode(CompanyModel.self, from: jsonData)
            completion(companyModel)
        } catch {
            print(error)
        }
    }
}
