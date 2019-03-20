//
//  stringParser.swift
//  weather-app
//
//  Created by RMS2018 on 20/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import Foundation

class StringParser: StringParserProtocol{
    func parse(string: String) -> String { return string.replacingOccurrences(of: " ", with: "%20") }
}
