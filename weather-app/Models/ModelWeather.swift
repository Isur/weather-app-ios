//
//  ModelWeather.swift
//  weather-app
//
//  Created by RMS2018 on 06/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import Foundation

class WeatherModel: Codable{
    let weather: [Weather]
    let main: MainWeather
    let visibility: Int         // Current visibility
    let wind: Wind
    let id: Int
    let name: String            // City name
    init(weather: Weather, main: MainWeather, visibility: Int, wind: Wind, id: Int, name: String){
        self.weather = [weather]
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.id = id
        self.name = name
    }
}

class Weather: Codable{
    let main: String            // Main description
    let description: String     // Longer description
    init(main: String, description: String){
        self.main = main
        self.description = description
    }
}

class MainWeather: Codable{
    var temp: Double
    let pressure: Double
    let humidity: Double
    var temp_min: Double
    var temp_max: Double
    init(temp: Double, pressure: Double, humidity: Double, temp_min: Double, temp_max: Double){
        self.temp = temp
        self.pressure =  pressure
        self.humidity = humidity
        self.temp_min = temp_min
        self.temp_max = temp_max
    }
}

class Wind: Codable{
    let speed: Double
    var deg: Double?
    init(speed:Double, deg:Double){
        self.speed = speed
        if deg != nil {self.deg = deg} else { self.deg = nil }
    }
}



