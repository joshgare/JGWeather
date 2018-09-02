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
        
        styleController()
        
        //Register UITableView XIBs
        layoutTableView.register(UINib(nibName: "JGMapTableViewCell", bundle: nil), forCellReuseIdentifier: "JGMapTableViewCell")
        layoutTableView.register(UINib(nibName: "JGCurrentlyTableViewCell", bundle: nil), forCellReuseIdentifier: "JGCurrentlyTableViewCell")
        layoutTableView.register(UINib(nibName: "JGHourlyTableViewCell", bundle: nil), forCellReuseIdentifier: "JGHourlyTableViewCell")
        layoutTableView.register(UINib(nibName: "JGDailyTableViewCell", bundle: nil), forCellReuseIdentifier: "JGDailyTableViewCell")

        retrieveForecastData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func styleController() {
        // Styles the view controller
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        let refreshBarButonItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(retrieveForecastData))
        navigationItem.rightBarButtonItem = refreshBarButonItem
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func retrieveForecastData() {
        // Retrieves data from Dark Sky and readies for presentation
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIClient.shared.retrieveForecastForCurrentLocation { (success, forecast, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if let error = error {
                // TODO: Handle the error either by informing the user or falling back to a defauly location (most likely cause will be GPS errors due to permissions)
                print("[API Error]", error.localizedDescription)
            } else if let forecast = forecast {
                self.retrievedForecast = forecast
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return retrievedForecast == nil ? 0 : 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return retrievedForecast?.daily?.data?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // For each cell we must pass on the correct View Model so that our data can be displayed to the user
        switch indexPath.section {
        case 0:
            let cell: JGMapTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JGMapTableViewCell") as! JGMapTableViewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell: JGCurrentlyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JGCurrentlyTableViewCell") as! JGCurrentlyTableViewCell
            if let currently = retrievedForecast?.currently {
                cell.currentlyViewModel = JGCurrentlyViewModel(currently: currently)
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell: JGHourlyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JGHourlyTableViewCell") as! JGHourlyTableViewCell
            if let hourly = retrievedForecast?.hourly {
                cell.hourlyViewModel = JGHourlyViewModel(hourly: hourly)
            }
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell: JGDailyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "JGDailyTableViewCell") as! JGDailyTableViewCell
            if let dailyDatum = retrievedForecast?.daily?.data?[safe: indexPath.row] {
                cell.dailyDatumViewModel = JGDailyDatumViewModel(dailyDatum: dailyDatum)
            }
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Each type of row has it's own specific height
        switch indexPath.section {
        case 0:
            return 150.0
        case 1:
            return 60.0
        case 2:
            return 92.0
        case 3:
            return 52.0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.section {
        case 1:
            // Display additional weather information on it's own UIViewController pushed onto the UINavigationController
            let infoViewController: InfoViewController = InfoViewController.instantiate()
            infoViewController.title = NSLocalizedString("Info", comment: "")
            if let currently = retrievedForecast?.currently {
                infoViewController.currentlyViewModel = JGCurrentlyViewModel(currently: currently)
            }
            navigationController?.pushViewController(infoViewController, animated: true)
        default:
            return
        }
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
