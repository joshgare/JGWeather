//
//  MapTableViewCell.swift
//  Weather
//
//  Created by Joshua Gare on 27/11/2017.
//  Copyright © 2017 Josh Gare. All rights reserved.
//

import UIKit
import MapKit

class JGMapTableViewCell: UITableViewCell, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Track the users location and make sure the map stays aligned with the users current location
        map.setUserTrackingMode(.follow, animated: false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
