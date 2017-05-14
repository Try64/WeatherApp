//
//  ViewController.swift
//  WeatherApp
//
//  Created by studentNumber13 on 5/12/17.
//  Copyright © 2017 studentNumber13. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate{

    
    let manager = CLLocationManager()
    var currentLocation:CLLocation?
    var ansArray:[String]?
    var one:String?
    var two:String?
    var three:String?
    
    
    
    
    @IBOutlet var LabelTemperature: UILabel!
    @IBOutlet var LabelWindSpeed: UILabel!
    @IBOutlet var LabelHumidity: UILabel!
    @IBOutlet var ShowTemperature: UILabel!
    @IBOutlet var ShowWindspeed: UILabel!
    @IBOutlet var ShowHumidity: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        let tryObj = NetworkPortion(CoOrdinate: currentLocation!)
        tryObj.getTheInfo()
        // = tryObj.returnData()
        //print(ansArray![0])
        one? = (tryObj.me?.a)!
        two? = (tryObj.me?.b)!
        three? = (tryObj.me?.c)!
        print((tryObj.me?.a)!)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        
        
        
        
        //let url = URL(string: <#T##String#>)
        
        }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[0] as CLLocation
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print (error)
    }

    
}

