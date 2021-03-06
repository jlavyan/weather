//
//  ViewController.swift
//  WeatherMap
//
//  Created by Grigori on 7/17/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet private var aMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHandlers()
    }
}


private extension MapViewController{
    /// Add double tap handler on map view
    private func addHandlers(){
        let doubleGesture = UITapGestureRecognizer(target: self, action:#selector(onDoubleTap))
        doubleGesture.numberOfTapsRequired = 2;
        doubleGesture.numberOfTouchesRequired = 1;

        // We using tap gesture since map kit cancel double tap
        let tapGesture = UILongPressGestureRecognizer(target: self, action:#selector(onDoubleTap))
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;

        doubleGesture.delegate = self
        tapGesture.delegate = self
        aMap.addGestureRecognizer(doubleGesture)
        aMap.addGestureRecognizer(tapGesture)
    }
    
}


extension MapViewController: UIGestureRecognizerDelegate{
    @objc func onDoubleTap(gestureRecognizer: UITapGestureRecognizer){
        let location = gestureRecognizer.location(in: aMap)
        let coordinate = aMap.convert(location, toCoordinateFrom: aMap)

        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        aMap.addAnnotation(annotation)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
