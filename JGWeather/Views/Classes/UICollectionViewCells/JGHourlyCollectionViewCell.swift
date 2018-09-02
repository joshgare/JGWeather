//
//  HourlyCollectionViewCell.swift
//  Weather
//
//  Created by Joshua Gare on 27/11/2017.
//  Copyright © 2017 Josh Gare. All rights reserved.
//

import UIKit

class JGHourlyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var hourLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    var currentlyViewModel: JGCurrentlyViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateView() {
        guard let currentlyViewModel = currentlyViewModel else { return }
        hourLabel.text = currentlyViewModel.timeAsHourText
        temperatureLabel.text = currentlyViewModel.temperatureText
        iconImageView.image = UIImage(named: currentlyViewModel.iconText)
    }

}
