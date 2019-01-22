//
//  SourceListViewModel.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import Foundation

class WeatherListViewModel: NSObject{
    var lat: String?
    var lon: String?
    private var weatherAPIService: WeatherAPIService = WeatherAPIService()
    
    var reloadModelList = {()->() in}
    var weatherViewModels: [WeatherSource]? = []{
        didSet{
            reloadModelList()
        }
    }
    var dailyViewModels: [[WeatherSource]] = []
    
    func populateSources(){
        self.weatherAPIService.loadSources(lat: lat!, lon: lon!) { (sources) in
            self.weatherViewModels?.append((sources?.first)!)
            self.dailyViewModels.append(sources!)
        }
    }
    
}


