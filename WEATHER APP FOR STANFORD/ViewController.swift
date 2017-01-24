//
//  ViewController.swift
//  WEATHER APP FOR STANFORD
//
//  Created by Jan Bandachowicz on 23/01/2017.
//  Copyright © 2017 Jan Bandachowicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    
    let weatherService = WeatherService()
    
    
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cloudsLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    
    
    @IBAction func setCityTapped(sender: UIButton) {
        print("City Button tapped")
        openCityAlert()
    }
    
    
    func openCityAlert() {
        let alert = UIAlertController(title: "City",
            message: "Enter City Name",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel =  UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: nil)
        
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
                print("OK")
        let textField = alert.textFields?[0]
                print(textField?.text!)
            self.cityLabel.text = textField?.text!
            let cityName = textField?.text
            self.weatherService.getWeather(cityName!)
        }
        
        alert.addAction(ok)
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "City Name"
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    func setWeather(weather: Weather) {
       
        let formatter = NSNumberFormatter()
        let f = formatter.stringFromNumber(weather.tempc)!
       
        print(weather.tempc)
        
        
        cityLabel.text = weather.cityName
        temperatureLabel.text = "\(f)"
        descriptionLabel.text = weather.description
        iconImage.image = UIImage(named: weather.icon)
        cloudsLabel.text = "clouds: \(weather.clouds)%"
        windLabel.text = "Humidity: \(weather.humidity)%"
        
    }
    
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.weatherService.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

