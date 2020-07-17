//
//  DetailView.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class DetailView: UIStackView{
    @IBOutlet private var idLabel: UILabel!
    @IBOutlet private var mainLabel: UILabel!
    @IBOutlet private var descLabel: UILabel!
    @IBOutlet private var iconLabel: UILabel!

    func configure(_ weather: Weather){
        idLabel.text = "id: \(weather.id)"
        mainLabel.text = "main: \(weather.main)"
        descLabel.text = "description: \(weather.description)"
        iconLabel.text = "icon: \(weather.icon)"
    }

    
}
