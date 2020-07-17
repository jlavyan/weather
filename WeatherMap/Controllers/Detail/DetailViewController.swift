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

    @IBOutlet private var detailView: DetailView!

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
            if let weather = weather?.weather.first{
                self.detailView.configure(weather)
            }else{
                self.errorOnLoad()
            }
        }, onError: {
            self.errorOnLoad()
        })
    }
}


/// Allerts
private extension DetailViewController{
    func errorOnLoad(){
        let alertController = UIAlertController(title: "Error", message: "We had problem when load weather", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
