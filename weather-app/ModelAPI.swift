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
    
    
    
    func getWeather(){
        var query = URL(string: SERVER + "q=" + city + "&appid=" + API_KEY)!
        
        let task = URLSession.shared.dataTask(with: query) { (data, response, error) in
            if error == nil {
//                os_log(response)
//                os_log(data)
                guard let content = data else { print("")
                    return
                }
                guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) ) as? [String: Any] else {
                    print("...")
                    return
                }
                // guard let weather = try? JSONDecoder().decode() else { return }
                os_log("response xD")
            } else {
                os_log("errory")
            }
        }
        task.resume()
    }
    
}
