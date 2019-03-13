//
//  ViewController.swift
//  weather-app
//
//  Created by RMS2018 on 06/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import UIKit
import os;
class ViewController: UIViewController {
    let model = APICalls()
    @IBOutlet weak var CityLabel: UITextField!
    @IBOutlet weak var WeatherInfoLabel: UILabel!
    @IBAction func actionSubmit(_ sender: Any) {
        let city = CityLabel.text!
        model.getWeather(city: city, completionHandler: { weather, error in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.WeatherInfoLabel.text = "Weather in:  \(weather.name) \n Temp: \(weather.main.temp) \n Wind speed: \(weather.wind.speed) \n \(weather.weather[0].description)"
                }
                
            } else {
                DispatchQueue.main.async {
                    self.WeatherInfoLabel.text = "Error..."
                }
                
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.WeatherInfoLabel.text = "Here you will see weather info..."
        // Do any additional setup after loading the view, typically from a nib.
    }


}

