//
//  PixAPI.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct PixAPI {
    
    static func getPixPhotos(_ urlString: String, completion: @escaping (Result<[PixPhoto],NetworkError>) -> ()){
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(request) { result in
            switch result{
            case .failure(let netError):
                completion(.failure(.networkClientError(netError)))
            case .success(let data):
                do {
                    let photos = try JSONDecoder().decode(PixWrapperClass.self, from: data)
                    completion(.success(photos.hits))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func getPixURL(_ query: String) -> String {
        let searchQuery = query.components(separatedBy: " ").joined(separator: "+")
        return "https://pixabay.com/api/?key=\(ApiKeys.pixApiKey)&q=\(searchQuery)"
    }
}
