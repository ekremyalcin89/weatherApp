//
//  ViewController.swift
//  weatherApp
//
//  Created by Ekrem on 20.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var city = ""
    
    @IBOutlet weak var cityTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   

    @IBAction func getWeatherButton(_ sender: Any) {
        
        city = cityTextField.text!
       
        
        if city.isEmpty {
            let alert = UIAlertController(title: "error", message: "Please enter city.", preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            
            alert.addAction(okButton)
            
            self.present(alert, animated: true, completion: nil)
            
        } else {
            
            performSegue(withIdentifier: "toWeatherVc", sender: nil) }
}
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "toWeatherVc" {
    
            let destinationVc = segue.destination as! detailViewController
            
            destinationVc.cityName = city
            
        }
    }
    
}

