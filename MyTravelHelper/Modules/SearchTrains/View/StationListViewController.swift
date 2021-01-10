//
//  StationListViewController.swift
//  MyTravelHelper
//
//  Created by siva krishna on 07/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import UIKit

class StationListViewController: UIViewController {
    var stationsList:[Station] = [Station]()
    var favoriteStations:Set = Set<Station>()
    @IBOutlet weak var stationsTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func checkFavorite(sender: UIButton) {
        let station = stationsList[sender.tag]
        if favoriteStations.contains(station) {
            favoriteStations.remove(station)
        } else {
            favoriteStations.insert(station)
        }
        stationsTableview.reloadData()
        saveFavorites()
    }
    
    func saveFavorites() {
        let userDefaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self.favoriteStations) {
                UserDefaults.standard.set(data, forKey: "FavoriteStations")
            }
        userDefaults.synchronize()
    }
}

extension StationListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stationsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "station", for: indexPath) as! StationInfoCell
        let station = stationsList[indexPath.row]
        cell.stationNameLabel.text = station.stationDesc
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(checkFavorite), for: .touchUpInside)
        if favoriteStations.contains(station) {
            cell.favoriteButton.setTitle("UnFavorite", for: .normal)
        } else {
            cell.favoriteButton.setTitle("Favorite", for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
