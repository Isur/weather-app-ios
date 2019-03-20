//
//  weatherParser.swift
//  weather-app
//
//  Created by RMS2018 on 20/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import Foundation

class WeatherParser: WeatherParserProtocol{
    func tempParser(temp: Double) -> Double {
        return temp - 272.15
    }}
