//
//  WeatherFull.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class WeatherFull: Codable{
    let weather: [Weather]
    
    
    static func parse(json: Data) -> WeatherFull? {
        let decoder = JSONDecoder()

        if let model = try? decoder.decode(WeatherFull.self, from: json) {
            return model
        }else{
            return nil
        }
    }
}
