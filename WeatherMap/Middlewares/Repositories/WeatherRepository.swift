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
    
    let queue = DispatchQueue.global(qos: .utility)

    init(baseUrl: String = "http://api.openweathermap.org/data/2.5/weather") {
        self.baseUrl = baseUrl
    }
    
    
    func loadWeather(latitude: Double, longitude: Double, onFinish: @escaping (WeatherFull?) -> (), onError: @escaping () -> ()){
        let urlString = "\(baseUrl)\(weatherPath(latitude, longitude))"

        queue.async{
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url), let weather = WeatherFull.parse(json: data) {
                    self.callOnMain {
                        onFinish(weather)
                    }
                }else{
                    self.callOnMain {
                        onError()
                    }
                }
            }else{
                self.callOnMain {
                    onError()
                }
            }
        }
    }
    
    func callOnMain(callBack: @escaping () -> ()){
        DispatchQueue.main.async {
            callBack()
        }
    }
}

private extension WeatherRepository{
    private func weatherPath(_ latitude: Double, _ longitude: Double) -> String{
        return "?lat=\(latitude)&lon=\(longitude)&appid=78768abda974ecbd64d6f70b441bcd8d"
    }
}
