//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // ––––– TODO: Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    
    // –––––– TODO: Initialize restaurantsArray
    var restaurantArray: [[String: Any?]] = []
    
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getAPIData()
        tableView.rowHeight = 150
    }
    
    // The protocols
    
    // How many cells will there be
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }
    
    // What type of cell we are configuring
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell") as! RestaurantTableViewCell
        
        let restaurant = restaurantArray[indexPath.row]
        
        // Set label to restaurant name for each cell
        cell.restaurantLabel.text = restaurant["name"] as? String ?? ""
        
        // Set image of restaurant
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        return cell
    }
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            print(restaurants)
            self.restaurantArray = restaurants
            self.tableView.reloadData()
        }
    }

}

// ––––– TODO: Create tableView Extension and TableView Functionality


