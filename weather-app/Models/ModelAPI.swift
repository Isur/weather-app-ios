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
    let stringParser: StringParserProtocol = StringParser()
    let weatherParser: WeatherParserProtocol = WeatherParser()
    var city : String = "Gliwice"
    
    func getWeather(city:String, completionHandler: @escaping (WeatherModel?, Error?) -> Void){
        let q = stringParser.parse(string: SERVER + "q=" + city + "&appid=" + API_KEY)
        let queryURL = URL(string: q)!
        
        let task = URLSession.shared.dataTask(with: queryURL) { (data, response, error) in
            if error == nil {
                do{
                    print("xd 1?")
                    let dataResponse = data
                    print("xd 2?")
                    let decoder = JSONDecoder()
                    print("xd 3?")
                    let model = try decoder.decode(WeatherModel.self, from: dataResponse!)
                    print("xd 4?")
                    model.main.temp = self.weatherParser.tempParser(temp: model.main.temp)
                    model.main.temp_max = self.weatherParser.tempParser(temp: model.main.temp_max)
                    model.main.temp_min = self.weatherParser.tempParser(temp: model.main.temp_min)
                    completionHandler(model, nil)
                    print("Temperature in ", model.name, "is equal to: ", model.main.temp)
                } catch let err{
                    print("error")
                    completionHandler(nil, err)
                }
                
            }
        }
        task.resume()
        print(task)
    }
    
}
