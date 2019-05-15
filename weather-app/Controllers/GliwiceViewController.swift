//
//  GliwiceViewController.swift
//  weather-app
//
//  Created by Artur on 15/05/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import UIKit

class GliwiceViewController: UIViewController {
    var model: APICalls?
    var weather: WeatherModel?
    @IBOutlet weak var weatherLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getWeather()
        // Do any additional setup after loading the view.
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
    
    private func getWeather(){
        let city = "Gliwice"
        model?.getWeather(city: city, completionHandler: { weather, error in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                    self.weatherLabel.text = self.getWeatherInfoString()
                }
                
            } else {
                DispatchQueue.main.async {
                    self.weatherLabel.text = "Error..."
                }
                
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
