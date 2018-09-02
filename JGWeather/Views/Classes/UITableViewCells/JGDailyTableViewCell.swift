//
//  JGDailyTableViewCell.swift
//  JGWeather
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import UIKit

class JGDailyTableViewCell: UITableViewCell {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var highTemperatureLabel: UILabel!
    @IBOutlet var lowTemperatureLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var percentageLabel: UILabel!
    var dailyDatumViewModel: JGDailyDatumViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView() {
        // The weather data is set before the view loads, once the view has loaded we must display the data
        guard let dailyDatumViewModel = dailyDatumViewModel else { return }
        dayLabel.text = dailyDatumViewModel.timeAsDayText
        highTemperatureLabel.text = dailyDatumViewModel.temperatureHighText
        lowTemperatureLabel.text = dailyDatumViewModel.temperatureLowText
        iconImageView.image = UIImage(named: dailyDatumViewModel.iconText)
        percentageLabel.text = dailyDatumViewModel.precipProbabilityText
    }
    
}
