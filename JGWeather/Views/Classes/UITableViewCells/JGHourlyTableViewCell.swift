//
//  JGHourlyTableViewCell.swift
//  JGWeather
//
//  Created by Joshua Gare on 02/09/2018.
//  Copyright © 2018 Josh Gare. All rights reserved.
//

import UIKit

class JGHourlyTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var hourlyCollectionView: UICollectionView!
    var hourlyViewModel: JGHourlyViewModel? {
        didSet {
            updateView()
        }
    }
    var hourlyDataArray: [JGCurrently] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hourlyCollectionView.register(UINib(nibName: "JGHourlyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JGHourlyCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateView() {
        guard let hourlyViewModel = hourlyViewModel else { return }
        hourlyDataArray = hourlyViewModel.hourlyDataArray
        hourlyCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: JGHourlyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JGHourlyCollectionViewCell", for: indexPath) as! JGHourlyCollectionViewCell
        cell.currentlyViewModel = JGCurrentlyViewModel(currently: hourlyDataArray[indexPath.item])
        return cell
    }
    
}
