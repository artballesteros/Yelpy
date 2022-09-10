//
//  RestaurantTableViewCell.swift
//  Yelpy
//
//  Created by Arturo Ballesteros-Ontiveros on 9/6/22.
//  Copyright © 2022 memo. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantFoodType: UILabel!
    @IBOutlet weak var restaurantRatingsCount: UILabel!
    @IBOutlet weak var restaurantNumber: UILabel!
    @IBOutlet weak var restaurantRating: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
