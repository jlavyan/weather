//
//  Weather.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class Weather: Codable{
    let id: Int
    let main: String
    let description: String
    let icon: String
}
