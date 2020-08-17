//
//  ViewController.swift
//  Yasmin_A_WeatherApp_Exercise
//
//  Created by Yasmin Alberto Ruiz on 8/17/20.
//  Copyright © 2020 Yasmin Alberto Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var currentSummary: UILabel!
    @IBOutlet var currentDewpoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
            if let data = NSData(contentsOf: url as URL){
            do {
        let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]

    let newDict = parsed
                
                print(newDict["currently"]!["Summary"] as Any)
                print(newDict["currently"]!["Temperature"] as Any)
                print(newDict["currently"]!["Dewpoint"] as Any)
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"
                    self.currentDewpoint.text = "\(newDict["currently"]!["dewPoint"]!!)"

                }
                
            catch let error as NSError {
                print("A JSON parasithng error occurred, here are the details:\n \(error)")
                }
            }
        }
    }
}
