//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {
    
    func testNetworkHelper(){
        // arrange
        let stringURL = PixAPI.getPixURL("Black Bear")
        guard let url = URL(string: stringURL) else {
            XCTFail("Could not form a valid url")
            return
        }
        let request = URLRequest(url: url)
        let exp = expectation(description: "Receive some data")
        
        // act
        
        NetworkHelper.shared.performDataTask(request) { result in
            switch result {
            case .failure(let error):
                XCTFail("\(error)")
            case .success(let data):
                // assert
                exp.fulfill()
                XCTAssertNotNil(data)
            }
        }
        wait(for: [exp], timeout: 3.0)
    }
}
