//
//  Restaurant.swift
//  Yelpy
//
//  Created by Memo on 5/21/20. Edited by Jason Lee on 3/20/22
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    

    var imageURL: URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: Int
    // TODO: Lab 6 Step 2b - Refactor Restaurant Model
    
    

    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as! Int
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        mainCategory = Restaurant.getMainCategory(dict: dict)
        // TODO: Lab 6 Step 2b - Refactor Restaurant Model
    }
    
    // Helper function to get First category from restaurant
    static func getMainCategory(dict: [String:Any]) -> String {
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
    }

    
}
