//
//  PixModel.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct PixWrapperClass: Codable {
    var hits: [PixPhoto]
}

struct PixPhoto: Codable{
    var largeImageURL: String
}

struct StoragePhoto: Codable, Equatable{
    var photoData: Data
}
