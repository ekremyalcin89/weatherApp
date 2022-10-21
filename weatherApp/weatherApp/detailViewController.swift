//
//  detailViewController.swift
//  weatherApp
//
//  Created by Ekrem on 20.10.2022.
//

import UIKit
import Foundation

class detailViewController: UIViewController {
    var cityName = ""
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityLabel.text = cityName
        getTodayWeather(cityLabel: cityName)
    }
    
    func getTodayWeather(cityLabel: String) {
        
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=35.9439&longitude=32.8560&hourly=temperature_2m&current_weather=true&timezone=Europe%2FBerlin")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let weather = jsonResponse["current_weather"] as? [String : Any] {
                                
                                if let temperature = weather["temperature"] as? Double {
                                    self.degreeLabel.text = String(temperature)
                                }
                            }
                        }
                        
                        
                    } catch {
                        print("error")
                    }
                    
                }
                
            }
        }
        task.resume()
    }

}
