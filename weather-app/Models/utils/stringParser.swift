//
//  stringParser.swift
//  weather-app
//
//  Created by RMS2018 on 20/03/2019.
//  Copyright © 2019 RMS2018. All rights reserved.
//

import Foundation

class StringParser: StringParserProtocol{
    func parse(string: String) -> String {
        // ąśćłóężź
        // var returnString = string.replacingOccurrences(of: "ą", with: "a")
        let str = swapCharacters(string: string,
                                 toSwap:    ["ą", "ś", "ć", "ł", "ó", "ę", "ź", "ć", "ż", "ń"],
                                 swap:      ["a", "s", "c", "l", "o", "e", "z", "c", "z", "n"]);
        let toReturn = str.replacingOccurrences(of: " ", with: "%20")
        print(toReturn)
        return toReturn
    }
    
    private func swapCharacters(string: String, toSwap: [String], swap: [String]) -> String{
        var s = string.lowercased()
        var index = 0
        for char in toSwap{
            s = s.replacingOccurrences(of: toSwap[index], with: swap[index])
            index += 1
        }
        
        return s
    }
}
