//
//  WeatherService.swift
//  RespApiCall-weather
//
//  Created by Mattia on 17/12/2015.
//  Copyright © 2015 Mattia. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    
    func setWeather(weather: Weather)
    
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    
    func getWeather(city: String) {
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=Pescara,appid=2de143494c0b295cca9337e1e96b00e0"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            print(">>>>>\(data)")
            print(response)
        }
        task.resume()
        
        
//        print("Weather Service city: \(city)")
//        
//        let weather = Weather(cityName: city, temp: 237.12, description: "A nice day")
//        
//        if delegate != nil {
//           delegate?.setWeather(weather)
//        }
        
    }
    
}