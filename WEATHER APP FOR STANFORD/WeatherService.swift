//
//  WeatherService.swift
//  WEATHER APP FOR STANFORD
//
//  Created by Jan Bandachowicz on 23/01/2017.
//  Copyright © 2017 Jan Bandachowicz. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    
    
    func getWeather(city: String) {
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!),uk&appid=24e0a89c0917f3420ead97a17ece926e"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            
            let json = JSON(data: data!)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            let name = json["name"].string
            let desc = json["weather"][0]["description"].string
            let icon = json["weather"][0]["icon"].string
            let clouds = json["clouds"]["all"].double
            let humid = json["main"]["humidity"].double
            
            
            let weather = Weather(cityName: name!, temp: temp!, description: desc!, icon: icon!,clouds: clouds!,humidity: humid!)
            
            if self.delegate != nil {
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.delegate?.setWeather(weather)
            })

                
    }
            
            print("Lat: \(lat!) lon: \(lon!) temp: \(temp!)")
            
        }
        
        task.resume()

    }
}