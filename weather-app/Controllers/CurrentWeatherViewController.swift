//
//  ViewController.swift
//  weather-app
//
//  Created by RMS2018 on 06/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import UIKit
import os;
class ViewController: UIViewController, UITextFieldDelegate {
    let model = APICalls()
    var weather: WeatherModel?
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var CityLabel: UITextField!
    @IBOutlet weak var WeatherInfoLabel: UILabel!
    @IBAction func actionSubmit(_ sender: Any) {
       getWeather()
    }

    @IBAction func actionClear(_ sender: Any) {
        self.CityLabel.text = ""
        self.WeatherInfoLabel.text = "Here you will see weather info..."
        self.imageView.image = nil
    }
    private func getWeather(){
        self.dismissKeyboard()
        let city = CityLabel.text!
        model.getWeather(city: city, completionHandler: { weather, error in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                    self.WeatherInfoLabel.text = self.getWeatherInfoString()
                    self.downloadImage(from: (self.weather?.weather[0].icon)!)
                }
                
            } else {
                DispatchQueue.main.async {
                    self.WeatherInfoLabel.text = "Error..."
                    self.imageView.image = nil
                }
                
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ForecastTableVC{
            let vc = segue.destination as? ForecastTableVC
            vc?.model = self.model
        }
        if segue.destination is GliwiceViewController{
            let vc = segue.destination as? GliwiceViewController
            vc?.model = self.model
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("tset")
        getWeather()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        //view.addGestureRecognizer(tap)
        self.CityLabel.becomeFirstResponder()
        self.CityLabel.delegate = self
        self.WeatherInfoLabel.text = "Here you will see weather info..."
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func dismissKeyboard(){
        CityLabel.resignFirstResponder()
    }
    
    func downloadImage(from url: String) {
        print("Download Started")
        self.model.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            //print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            print(data)
            DispatchQueue.main.async() {
                print("SET IMAGE")
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    private func getWeatherInfoString() -> String{
        if weather != nil {
            let temp = String(format: "%.2f", self.weather!.main.temp) + "°C"
            let name = self.weather!.name
            let windSpeed = "\(self.weather!.wind.speed) m/s"
            let description = self.weather!.weather[0].description
            let visibility = "Visibility: \(self.weather?.visibility ?? 0)"
            return "Weather in:  \(name) \n Temp: \(temp) \n Wind speed: \(windSpeed) \n \(description)\n \(visibility)"
        } else {
            return "Error..."
        }
    }

}

