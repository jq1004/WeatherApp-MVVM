//
//  CityAPIService.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON


class CityAPIService{
    private let cityAPIKey = "793282c6c8f3a70ed0d609c1b72f7a340fd480b811e6c72cdac895e689f69c22"
    
    func loadSources(cityName: String, completion: @escaping (CitySource?) -> Void) {
        // 1
        Alamofire.request("https://api.unsplash.com/search/photos?client_id=\(cityAPIKey)&query=\(cityName)")
            
            // 2
            .responseJSON { response in
                //                self.activityIndicator.stopAnimating()
                guard response.result.isSuccess,
                    let value = response.result.value else {
                        print("Error while fetching tags: \(String(describing: response.result.error))")
                        completion(nil)
                        return
                }
                 print("*******Printing city data")
                var data :CitySource?
                var jsonResponse = JSON(value)
                var resultsArr = jsonResponse["results"]
                var urls = resultsArr[0]["urls"]
                let url = urls["small"].stringValue
                data = CitySource(cityName: cityName.capitalized, img: URL(string: url)!)
//                print("imgurl \(data?.imgUrl)")
                // 4
                DispatchQueue.main.async {
                    completion(data)
                }
                
        }
    }
}
