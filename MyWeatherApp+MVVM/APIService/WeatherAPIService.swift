//
//  WebService.swift
//  MyWeatherApp+MVVM
//
//  Created by Junqing li on 1/21/19.
//  Copyright © 2019 Junqing li. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherAPIService{
    private let weatherAPIKey = "02164969bf428cc17cf55cf3626914ac"

    func loadSources(lat: String, lon:String, completion: @escaping (WeatherSource?) -> Void) {
        // 1
        Alamofire.request("https://api.darksky.net/forecast/\(weatherAPIKey)/\(lat),\(lon)")
            // 2
            .responseJSON { response in
                //                self.activityIndicator.stopAnimating()
                guard response.result.isSuccess,
                    let value = response.result.value else {
                        print("Error while fetching tags: \(String(describing: response.result.error))")
                        completion(nil)
                        return
                }
               
                var data :WeatherSource?
                var jsonResponse = JSON(value)
                
                print("*******Printing weather data")
   
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE"

                var daily = jsonResponse["daily"]
                for item in daily["data"]{
                    
                    let icon = item.1["icon"].stringValue
                    let lowTemp = "\(Int(round(item.1["temperatureMin"].doubleValue)))"
                    let highTemp = "\(Int(round(item.1["temperatureMax"].doubleValue)))"
                    let precipitation = "\(Int(round(item.1["precipProbability"].doubleValue*100)))"
                    let humidity = "\(Int(round(item.1["humidity"].doubleValue*100)))"
                    let wind = "\(Int(round(item.1["windSpeed"].doubleValue)))"
                    
                    print("precipitation: \(precipitation)")
                    print("humidity: \(humidity)")
                    print("wind: \(wind)")
                    
                    let seconds = item.1["time"].doubleValue
                    let timestampDate = NSDate(timeIntervalSince1970: seconds)
                    let day = dateFormatter.string(from: timestampDate as Date)
                   
                    data = WeatherSource(day: day, icon: icon.capitalized, lowTemp: lowTemp, highTemp: highTemp, precipitation: precipitation, humidity: humidity, wind: wind)
                    break
                }
                
                // 3
                DispatchQueue.main.async {
                    completion(data)
                }
                
        }
    }
}
