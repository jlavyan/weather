//
//  DetailModel.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import MapKit

class LocationDetailModel{
    private let weatherRepository = WeatherRepository()
    private let database = Database()

    func loadWeather(location: CLLocationCoordinate2D, onFinish: @escaping (WeatherFull?) -> (), onError: @escaping () -> ()){
        weatherRepository.loadWeather(latitude: location.latitude, longitude: location.longitude, onFinish: { (weather) in
            onFinish(weather)
            
            if let data = try? JSONEncoder().encode(weather){
                self.database.addWeather(latitude: location.latitude, longitude: location.longitude, data: data)
            }
        }) {
            // Try to load from local storage
            if let weatherFull = self.database.nearWeather(latitude: location.latitude, longitude: location.longitude){
                onFinish(weatherFull)
            }else{
                onError()
            }
        }
    }
}
