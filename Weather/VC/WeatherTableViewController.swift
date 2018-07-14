//
//  WeatherTableViewController.swift
//  Weather
//
//  Created by Joseph Sungpil Choi on 14/07/2018.
//  Copyright © 2018 Joseph Sungpil Choi. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://raw.githubusercontent.com/chousemath/resume_contract/master/test.json")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard error == nil else {
                return
            }
            
            guard let myData = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: myData, options: .mutableContainers) as? [String:Any] {
                    
                    guard let cod = json["cod"] as? String else {
                        print("No cod")
                        return
                    }
                    print("cod: \(cod)")
                    
                    guard let message = json["message"] as? Double else {
                        print("No message")
                        return
                    }
                    print("message: \(message)")
                    
                    guard let cnt = json["cnt"] as? Int else {
                        print("No cnt")
                        return
                    }
                    print("cnt: \(cnt)")
                    
                    guard let list = json["list"] as? [Any] else {
                        print("No list")
                        return
                    }
                    
                    let weather = Weather(cod: cod, message: message, cnt: cnt, list: list)
                    for forecast in weather.list {
                        if let myForecast = forecast as? Forecast {
                            print(myForecast)
                        }
                    }
                }
            } catch let error {
                print(error)
            }
        }
        
        task.resume()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)

        return cell
    }

}
