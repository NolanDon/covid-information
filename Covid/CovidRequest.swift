//
//  CovidRequest.swift
//  Covid
//
//  Created by Nolan on 2020-12-30.
//

import Foundation

enum CovidResponseError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct CovidRequest {
    let resourceURL: URL
//    let ext: String
    
    
    init() {
//        self.ext = ext
        let resourceString = "https://api.covid19api.com/country/canada\(ext)"
        
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func getCovidResult(completion: @escaping(Result<[String: String], CovidResponseError>) -> String) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                
                let jsonData = String(decoding: jsonData, as: UTF8.self) 
                
                var globalList = [String:String]()
                
                globalList["data"] = jsonData
                
                completion(.success(globalList))
            } catch {
                completion(.failure(.canNotProcessData))
    
            }
            
        }
        dataTask.resume()
    }
}
