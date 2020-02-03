//
//  FileManager+Extensions.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

extension FileManager{
    func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func filePathFromDocumentsDirectory(_ fileName: String) -> URL {
        return documentsDirectory().appendingPathComponent(fileName)
    }
}
