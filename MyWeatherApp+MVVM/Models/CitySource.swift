//
//  CitySource.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import Foundation
class CitySource {
    
    var cityName: String!
    var imgUrl: URL!
    
    init(cityName: String, img: URL) {
        self.cityName = cityName
        self.imgUrl = img
    }
    
}
