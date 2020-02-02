//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

enum NetworkError: Error{
    case badURL(String)
    case noData
    case networkClientError(Error)
    case decodingError(Error)
    case encodingError(Error)
    case noResponse
    case badStatusCode(Int)
}
