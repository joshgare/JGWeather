//
//  CurrentlyTableViewCell.swift
//  Weather
//
//  Created by Joshua Gare on 26/11/2017.
//  Copyright © 2017 Josh Gare. All rights reserved.
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
        guard let currentlyViewModel = currentlyViewModel else { return }
        currentTemperatureLabel.text = currentlyViewModel.temperatureText
        iconImageView.image = UIImage(named: currentlyViewModel.iconText)
    }
    
}
