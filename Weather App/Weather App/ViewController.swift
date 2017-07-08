//
//  ViewController.swift
//  Weather App
//
//  Created by Maciek Girek on 7/7/17.
//  Copyright © 2017 Maciek Girek. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var forecastLabel: UILabel!
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var tempIcon: UIImageView!
  @IBOutlet weak var dateTimeLabel: UILabel!
  @IBOutlet weak var windLabel: UILabel!
  @IBOutlet weak var windIcon: UIImageView!
  
  var cityFound = true
  var city: String!
  var dateAndTime: String!
  var temp: Double!
  var forecast: String!
  var icon: String!
  var wind: Double!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    searchBar.delegate = self
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    let urlRequest = URLRequest(url: URL(string: "http://api.apixu.com/v1/current.json?key=53289fd56a744f228c103633170707&q=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))")!)
    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      if error == nil {
        do {
          let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
          if let location = json["location"] as? [String: AnyObject] {
            if let cityName = location["name"] as? String {
              self.city = cityName
            }
            if let localtime = location["localtime"] as? String {
              self.dateAndTime = localtime
            }
          }
          if let current = json["current"] as? [String: AnyObject] {
            if let tempCelcius = current["temp_c"] as? Double {
              self.temp = tempCelcius
            }
            if let windKPH = current["wind_kph"] as? Double {
              self.wind = windKPH
            }
            if let condition = current["condition"] as? [String: AnyObject] {
              self.forecast = condition["text"] as! String
              let weatherIcon = condition["icon"] as! String
              self.icon = "http:\(weatherIcon)"
            }
            if let _ = json["error"] {
              self.cityFound = false
            }
          }
          DispatchQueue.main.async {
            if self.cityFound {
              self.cityLabel.text = self.city
              self.dateTimeLabel.text = self.dateAndTime
              self.tempLabel.text = "\(self.temp!)℃"
              self.forecastLabel.text = self.forecast
              self.tempIcon.downloadImage(from: self.icon)
              self.windLabel.text = "\(self.wind!)kph"
              self.cityLabel.isHidden = false
              self.dateTimeLabel.isHidden = false
              self.forecastLabel.isHidden = false
              self.tempLabel.isHidden = false
              self.tempIcon.isHidden = false
              self.windLabel.isHidden = false
              self.windIcon.isHidden = false
              self.cityFound = false
            } else {
              self.cityLabel.text = "City not found"
              self.cityFound = true
            }
          }
        } catch let error {
          print(error.localizedDescription)
        }
      }
    }; dataTask.resume()
  }
}
extension UIImageView {
  func downloadImage(from url: String) {
    let urlRequest = URLRequest(url: URL(string: url)!)
    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      if error == nil {
        DispatchQueue.main.async {
          self.image = UIImage(data: data!)
        }
      }
    }
    dataTask.resume()
  }
}
