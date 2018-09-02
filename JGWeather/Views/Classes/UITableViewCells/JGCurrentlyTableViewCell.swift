//
//  JGCurrentlyTableViewCell.swift
//  JGWeather
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import UIKit

class JGCurrentlyTableViewCell: UITableViewCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var currentTemperatureLabel: UILabel!
    var currentlyViewModel: JGCurrentlyViewModel? {
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
        guard let currentlyViewModel = currentlyViewModel else { return }
        currentTemperatureLabel.text = currentlyViewModel.temperatureText
        iconImageView.image = UIImage(named: currentlyViewModel.iconText)
    }
    
}
