//
//  NetworkPortion.swift
//  WeatherApp
//
//  Created by studentNumber13 on 5/12/17.
//  Copyright © 2017 studentNumber13. All rights reserved.
//

import Foundation
import CoreLocation


struct ans {
    var a:String
    var b:String
    var c:String
}

class NetworkPortion {
    
    var lat:String?
    var long:String?
    var url:String?
    var textTemperature:Double?
    var textWindspeed:Double?
    var textSummary:String?
    var okArray:[String]?
    var me:ans?
    
    init( CoOrdinate:CLLocation ){
        self.lat = String(CoOrdinate.coordinate.latitude)
        self.long = String (CoOrdinate.coordinate.longitude)
        self.url = "https://api.darksky.net/forecast/136a608f0572e158d7e84cd468f01f45/" + lat!  + "," + long!
    }
    
    
    func getTheInfo () {
        
        let finalUrl = URL(string: url!)
        let task = URLSession.shared.dataTask(with: finalUrl!, completionHandler:
            { (data, respose , error) in
                if error != nil {
                    print (error!)
                }
                else{
                    if let mydata = data {
                        
                        do{
                            let myJSON =  try JSONSerialization.jsonObject(with: mydata, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                            if let downObject = myJSON["currently"] as AnyObject? {
                                
                                self.textTemperature = (downObject["temperature"] as! Double)
                                self.textWindspeed = (downObject["windSpeed"] as! Double)
                                self.textSummary = (downObject["summary"] as! String)
                                
                                
                                self.me?.a = self.textSummary!
                                self.me?.b = String(self.textTemperature!)
                                self.me?.c = String(self.textWindspeed!)
                                //print(self.textSummary!)
                                //print(self.textTemperature!)
                                //print(self.textWindspeed!)
                                //self.okArray?[0] = self.textSummary!
                                //self.okArray?[1] = String(self.textTemperature!)
                                //self.okArray?[2] = String(self.textWindspeed!)
                            }
                         
                        }
                        catch{
                            print("ended with error")
                        }
                    }
                }
                })
     task.resume()
        
    }
    
    func get1() -> (String){
        print(self.textSummary!)

        return self.textSummary!
    }
    func get2() ->(String){
        print(self.textTemperature!)
        return String(self.textTemperature!)
    }
    func get3() -> (String){
        print(self.textWindspeed!)
        return String(self.textWindspeed!)
    }
    
    
    
    
    
}
