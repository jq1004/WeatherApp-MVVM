//
//  Source.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import Foundation
class WeatherSource {
    
    var day :String!
    var icon :String!
    var lowTemp :String!
    var highTemp :String!
    var precipitation: String!
    var humidity: String!
    var wind: String!
    init(day: String, icon: String, lowTemp: String, highTemp: String, precipitation: String, humidity: String, wind:String) {
        self.day = day
        self.icon = icon
        self.lowTemp = lowTemp
        self.highTemp = highTemp
        self.precipitation = precipitation
        self.humidity = humidity
        self.wind = wind
    }
    
}
