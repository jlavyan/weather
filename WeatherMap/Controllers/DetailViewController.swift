//
//  DetailViewController.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController{
    var location: CLLocationCoordinate2D?
    
    @IBOutlet private var indicatorView: UIActivityIndicatorView!

    var detailModel = LocationDetailModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWeather()
    }
}

/// Interact with model
private extension DetailViewController{
    func loadWeather(){
        guard let coordinate = location else{
            errorOnLoad()
            
            return
        }
        
        detailModel.loadWeather(location: coordinate, onFinish: { (weather) in
            print("success")
        }, onError: {
            
        })
    }
}


/// Allerts
private extension DetailViewController{
    func errorOnLoad(){
        
    }
}
