//
//  WeatherRepository.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

class WeatherRepository: Repository{
    var baseUrl: String
    
    init(baseUrl: String = "http://api.openweathermap.org/data/2.5/weather") {
        self.baseUrl = baseUrl
    }
    
    
    func loadWeather(latitude: Double, longitude: Double, onFinish: @escaping (WeatherFull?) -> (), onError: @escaping () -> ()){
        let urlString = "\(baseUrl)\(weatherPath(latitude, longitude))"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url), let weather = parse(json: data) {
                onFinish(weather)
            }else{
                onError()
            }
        }else{
            onError()
        }
    }
    
    private func parse(json: Data) -> WeatherFull? {
        let decoder = JSONDecoder()

        if let model = try? decoder.decode(WeatherFull.self, from: json) {
            return model
        }else{
            return nil
        }
    }

}

private extension WeatherRepository{
    private func weatherPath(_ latitude: Double, _ longitude: Double) -> String{
        return "?lat=\(latitude)&lon=\(longitude)&appid=78768abda974ecbd64d6f70b441bcd8d"
    }
}
