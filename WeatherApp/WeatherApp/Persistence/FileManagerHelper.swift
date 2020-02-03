//
//  PersistenceHelper.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct FileManagerHelper<T: Codable & Equatable>{
    
    private var fileName: String
    
    init(_ fileName: String){
        self.fileName = fileName
    }
    
    func getObject() throws -> [T] {
        guard let data = FileManager.default.contents(atPath: FileManager.default.filePathFromDocumentsDirectory(fileName).path) else {
            return []
        }
        return try PropertyListDecoder().decode([T].self, from: data)
    }
    
    func saveObject(_ object: T) throws {
        var savedObjects = try getObject()
        savedObjects.insert(object, at: 0)
        try serializeAndPersist(savedObjects)
    }
    
    func remove(_ index: Int) throws {
        var savedObjects = try getObject()
        savedObjects.remove(at: index)
        try serializeAndPersist(savedObjects)
    }
    
    func serializeAndPersist(_ objects: [T]) throws {
        let dataToWrite = try PropertyListEncoder().encode(objects)
        try dataToWrite.write(to: FileManager.default.filePathFromDocumentsDirectory(fileName), options: Data.WritingOptions.atomic)
    }
    
}
