//
//  DB.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import CoreData

class Database{
    func addWeather(latitude: Double, longitude: Double, data: Data){
        let context = getContext()

        let entity = NSEntityDescription.entity(forEntityName: "WeatherData", in: context)
        let weatherData = NSManagedObject(entity: entity!, insertInto: context) as? WeatherData
        weatherData?.latitude = latitude
        weatherData?.longitude = longitude
        weatherData?.data = data
        
        do {
           try context.save()
          } catch {
           print("Failed saving")
        }
    }
    
    func nearWeather(latitude: Double, longitude: Double) -> WeatherFull?{
        let context = getContext()

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherData")
        request.predicate = nearPredicate(latitude, longitude)
        request.fetchLimit = 1
        
        do {
            let result = try context.fetch(request)
            if let weatherData = result.first as? WeatherData, let data = weatherData.data{
                return WeatherFull.parse(json: data)
          }
            
        } catch {
            print("Failed")
        }
        
        return nil
    }

    
    /// This isn't very correct
    private func nearPredicate(_ latitude: Double, _ longitude: Double) -> NSPredicate{
        return NSPredicate(format: "itemLatitude BETWEEN {%f,%f} AND itemLongitude BETWEEN {%f,%f}", (latitude-0.10), (latitude+0.10), (longitude-0.10), (longitude+0.10))
    }
    
    private func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        return appDelegate.persistentContainer.viewContext
    }
}
