//
//  WeatherMapTests.swift
//  WeatherMapTests
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import XCTest
@testable import WeatherMap

class WeatherMapTests: XCTestCase {

    /// Load weather location make assert when we don't able to get
    func testLocationLoad() throws {
        let weatherRepository = WeatherRepository()

        let weatherExpectation = expectation(description: "weather")
        weatherRepository.loadWeather(latitude: 10, longitude: 10, onFinish: { (weather) in
            weatherExpectation.fulfill()
        }) {
            XCTAssertTrue(true)
        }
        
        waitForExpectations(timeout: 5) { (error) in
          XCTAssertTrue(true)
        }

    }

}
