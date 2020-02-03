//
//  UserDefaultsHelper.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct UserDefaultsKeys{
    static let zipCodeKey = "zipcode"
}

struct UserDefaultsHelper{
    
    static func addZipCode(_ zipCode: String) {
        UserDefaults.standard.set(zipCode, forKey: UserDefaultsKeys.zipCodeKey)
    }
    
    static func getZipCode() -> String {
        guard let zip = UserDefaults.standard.object(forKey: UserDefaultsKeys.zipCodeKey) as? String else {
            return ""
        }
        return zip
    }
}
