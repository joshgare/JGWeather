//
//  MainViewController.swift
//  JGWeather
//
//  Created by Joshua Gare on 31/08/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import UIKit
import MBProgressHUD

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var layoutTableView: UITableView!
    var retrievedForecast: JGForecast? {
        didSet {
            layoutTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        retrieveForecastData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveForecastData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIClient.shared.retrieveForecastForCurrentLocation { (success, forecast, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if let error = error {
                print("[API Error]", error.localizedDescription)
            } else if let forecast = forecast {
                self.retrievedForecast = forecast
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
