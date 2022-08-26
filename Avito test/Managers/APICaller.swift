//
//  APICaller.swift
//  Avito test
//
//  Created by Gleb Glushok on 23.08.2022.
//

import Foundation

struct Constants {
    static let apiURL = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    func getData(completion: @escaping (Result<[Employee], Error>) -> Void) {
        
        guard let url = URL(string: Constants.apiURL) else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(Avito.self, from: data)
                completion(.success(results.company.employees))
                print(results)
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
}


