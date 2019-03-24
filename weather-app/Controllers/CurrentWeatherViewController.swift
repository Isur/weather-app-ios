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
    var weather: WeatherModel?
    @IBOutlet weak var CityLabel: UITextField!
    @IBOutlet weak var WeatherInfoLabel: UILabel!
    @IBAction func actionSubmit(_ sender: Any) {
        let city = CityLabel.text!
        model.getWeather(city: city, completionHandler: { weather, error in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                    self.WeatherInfoLabel.text = self.getWeatherInfoString()
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

    
    private func getWeatherInfoString() -> String{
        if weather != nil {
            let temp = String(format: "%.2f", self.weather!.main.temp) + "°C"
            let name = self.weather!.name
            let windSpeed = "\(self.weather!.wind.speed) m/s"
            let description = self.weather!.weather[0].description
            return "Weather in:  \(name) \n Temp: \(temp) \n Wind speed: \(windSpeed) \n \(description)"
        } else {
            return "Error..."
        }
    }

}
