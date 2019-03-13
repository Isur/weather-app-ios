//
//  ModelAPI.swift
//  weather-app
//
//  Created by RMS2018 on 06/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import Foundation
import os
class APICalls {
    let API_KEY : String = "0e859b4b2d8718ad85b6f74c353726f6"
    let SERVER : String = "https://api.openweathermap.org/data/2.5/weather?"
    
    var city : String = "Gliwice"
    
    func getWeather(city:String){
        let queryURL = URL(string: SERVER + "q=" + city + "&appid=" + API_KEY)!
        
        let task = URLSession.shared.dataTask(with: queryURL) { (data, response, error) in
            if error == nil {
                do{
                    let dataResponse = data
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(WeatherModel.self, from: dataResponse!)
                    print("Temperature in ", model.name, "is equal to: ", model.main.temp)
                } catch {
                    print("error")
                }
                
            }
        }
        task.resume()
    }
    
}
