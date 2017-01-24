//
//  Weather.swift
//  WEATHER APP FOR STANFORD
//
//  Created by Jan Bandachowicz on 23/01/2017.
//  Copyright © 2017 Jan Bandachowicz. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    let icon: String
    let clouds: Double
    let humidity: Double
   
    
    
    var tempc: Double {
        get{
            return temp - 273.15
        }
    }
    
    
    
    init (cityName: String, temp: Double, description: String, icon: String, clouds: Double, humidity: Double) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
        self.icon = icon
        self.clouds = clouds
        self.humidity = humidity
    }
}