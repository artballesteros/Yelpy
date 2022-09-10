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
    
    // Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)
    // Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    
    
    // Initialize restaurantsArray
    var restaurantArray: [[String: Any?]] = []
    
    
    // Add tableView datasource + delegate
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
        let categories = restaurant["categories"] as! [[String : Any]]
        
        // Set label to restaurant name for each cell
        cell.restaurantLabel.text = restaurant["name"] as? String ?? ""
        
        // Set restaurant ratings label for each cell
        if let reviewCount = restaurant["review_count"] as? Int {
            let countString = String(reviewCount)
            cell.restaurantRatingsCount.text = countString + " reviews"
        }
        
        // Set restaurant type label to correct type for each cell
        // Use first dictionary in array
        let foodType = categories[0]
        cell.restaurantFoodType.text = foodType["title"] as? String ?? "Food"
        
        // Set restaurant number labe to correct number for each cell
        cell.restaurantNumber.text = restaurant["display_phone"] as? String ?? "(xxx) xxx-xxxx"
        
        // Set image of restaurant
        if let imageUrlString = restaurant["image_url"] as? String {
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        // Set image for rating stars
        let ratingImage = getRatingImage(restaurant["rating"] as? Float ?? 0.0)
        cell.restaurantRating.image = ratingImage
        
        return cell
    }
    
    // Get data from API helper and retrieve restaurants
    func getAPIData() {
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else {
                return
            }
            self.restaurantArray = restaurants
            self.tableView.reloadData()
        }
    }
    
    // Get image from rating and return it
    func getRatingImage(_ rating: Float) -> UIImage {
        var ratingImage: UIImage!
        switch (rating) {
        case 1.0:
            ratingImage = UIImage(named: "small_1")
        case 1.5:
            ratingImage = UIImage(named: "small_1_half")
        case 2.0:
            ratingImage = UIImage(named: "small_2")
        case 2.5:
            ratingImage = UIImage(named: "small_2_half")
        case 3.0:
            ratingImage = UIImage(named: "small_3")
        case 3.5:
            ratingImage = UIImage(named: "small_3_half")
        case 4.0:
            ratingImage = UIImage(named: "small_4")
        case 4.5:
            ratingImage = UIImage(named: "small_4_half")
        case 5.0:
            ratingImage = UIImage(named: "small_5")
        default:
            ratingImage = UIImage(named: "small_0")
        }
        return ratingImage
    }

}

// ––––– TODO: Create tableView Extension and TableView Functionality


