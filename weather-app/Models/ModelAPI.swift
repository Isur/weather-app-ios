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
    let WEATHER : String = "https://api.openweathermap.org/data/2.5/weather?"
    let FORECAST : String = "https://api.openweathermap.org/data/2.5/forecast?"
    let stringParser: StringParserProtocol = StringParser()
    let weatherParser: WeatherParserProtocol = WeatherParser()
    var city : String = "Gliwice"
    
    func getWeather(city:String, completionHandler: @escaping (WeatherModel?, Error?) -> Void){
        let q = stringParser.parse(string: WEATHER + "q=" + city + "&appid=" + API_KEY)
        self.city = city
        guard let queryURL = URL(string: q) else {
            completionHandler(nil, NSError(domain:"",code:401))
            return
        }
        
        let task = URLSession.shared.dataTask(with: queryURL) { (data, response, error) in
            if error == nil {
                do{
                    let dataResponse = data
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(WeatherModel.self, from: dataResponse!)
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
    }
    
    func getWeatherForecast(completionHandler: @escaping (WeatherForecast?, Error?)->Void){
        let q = stringParser.parse(string: FORECAST + "q=" + city + "&appid=" + API_KEY)
        print("query url: \(q)")
        guard let queryURL = URL(string: q) else {
            completionHandler(nil, NSError(domain:"",code:401))
            return
        }
        
        let task = URLSession.shared.dataTask(with: queryURL) { (data, response, error) in
            if error == nil{
                do{
                    let dataResponse = data
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(WeatherForecast.self, from: dataResponse!)
                    for w in model.list{
                        w.main.temp = self.weatherParser.tempParser(temp: w.main.temp)
                        w.main.temp_max = self.weatherParser.tempParser(temp: w.main.temp_max)
                        w.main.temp_min = self.weatherParser.tempParser(temp: w.main.temp_min)
                                        }
                    completionHandler(model, nil)
                } catch let err{
                    print("error")
                    completionHandler(nil, err)
                }
            }
        }
        task.resume()
    }
    
}
