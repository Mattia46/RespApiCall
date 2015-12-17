//
//  ViewController.swift
//  RespApiCall-weather
//
//  Created by Mattia on 17/12/2015.
//  Copyright © 2015 Mattia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    
    let weatherService = WeatherService() // var che contiene l'instance della classe

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBAction func setCityButton(sender: UIButton) {
//        print("ciao")
        openCityAlert()
    }
    
    func openCityAlert(){
        
        let alert = UIAlertController(title: "City",
            message: "Enter city name",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Calcel",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
                print("OK")
                let textField = alert.textFields?[0]
                print(textField?.text!)
                self.cityLabel.text = textField?.text!
                
                let cityName = textField?.text
                self.weatherService.getWeather(cityName!)  // chiamo la func nell'altra classe
                
        }
        
        alert.addAction(ok)
    
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "City name"
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // Mark: weatherServiceDelegate
    
    func setWeather(weather: Weather) {
        print("*** Set Weather")
        print("City: \(weather.cityName) temp:\(weather.temp)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weatherService.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

