//
//  WeatherService.swift
//  RespApiCall-weather
//
//  Created by Mattia on 17/12/2015.
//  Copyright © 2015 Mattia. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    
    func setWeather()
    
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    
    func getWeather(city: String) {
        print("Weather Service city: \(city)")
        
        if delegate != nil {
           delegate?.setWeather()
        }
        
    }
    
}