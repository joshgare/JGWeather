//
//  InfoViewController.swift
//  JGWeather
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var precipitationLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windspeedLabel: UILabel!
    @IBOutlet var cloudcoverLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    var currentlyViewModel: JGCurrentlyViewModel?
    
    static func instantiate() -> InfoViewController {
        return UIStoryboard(name: "InfoViewController", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        styleController()
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func styleController() {
        navigationController?.navigationBar.tintColor = .white
    }
    
    func updateView() {
        guard let currentlyViewModel = currentlyViewModel else { return }
        summaryLabel.text = currentlyViewModel.summaryText
        precipitationLabel.text = currentlyViewModel.precipProbabilityText
        temperatureLabel.text = currentlyViewModel.temperatureText
        windspeedLabel.text = currentlyViewModel.windspeedText
        cloudcoverLabel.text = currentlyViewModel.cloudCoverText
        humidityLabel.text = currentlyViewModel.humidityText
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
