//
//  ImgListViewModel.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import Foundation

class CityListViewModel: NSObject{
    var cityName: String?
    private var cityAPIService: CityAPIService  = CityAPIService()
    
    var reloadModelList = {()->() in}
    var cityViewModels: [CitySource]? = []{
        didSet{
            reloadModelList()
        }
    }
    
    func populateSources(){
        
        self.cityAPIService.loadSources(cityName: cityName!) { (source) in
            self.cityViewModels?.append(source!)
            //            print(self.cityViewModels!.count)
        }
    }
    
    
    
}
