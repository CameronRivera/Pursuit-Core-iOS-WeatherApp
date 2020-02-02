//
//  NetworkHelper.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

class NetworkHelper{
    private var session = URLSession(configuration: .default)
    static let shared = NetworkHelper()
    
    private init(){
        
    }
    
    func performDataTask(_ request: URLRequest, completion: @escaping (Result<Data,NetworkError>) -> ()){
        
        let dataTask = session.dataTask(with: request) { data, urlResponse, error in
            
            if let error = error{
                completion(.failure(.networkClientError(error)))
            }
            
            guard let response = urlResponse as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            switch response.statusCode{
            case 200...299:
                break
            default:
                completion(.failure(.badStatusCode(response.statusCode)))
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask.resume()
    }
}

