//
//  DetailViewController.swift
//  Yelpy
//
//  Created by Memo on 5/26/20. Edited by Jason Lee on 3/20/22
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage
// TODO: Lab 6 Step 3c: Import

class RestaurantDetailViewController: UIViewController {
    // TODO: Lab 6 Step 3e: Conform to MapViewDelegate
    // TODO: Lab 6 Step 7a: Conform to PostImageViewDelegate
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    // TODO: Lab 6 Step 3b - Add mapView outlet
    // TODO: Lab 6 Step 4a
    
    // Initialize restaurant variable
    var r: Restaurant!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
        // TODO: Lab 6 Step 3f
    }
    
    // Add image to MapView Annotation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostImageVC" {
            let postImageVC = segue.destination as! PostImageViewController
            // TODO: Lab 6 Step 7d: Initialize PostImageViewController's delegate object
        }
    }

    func configureOutlets() {
        nameLabel.text = r.name
        reviewsLabel.text = String(r.reviews)
        starImage.image = Stars.dict[r.rating]!
        headerImage.af.setImage(withURL: r.imageURL!)
        
        // Extra: Add tint opacity to image to make text stand out
        let tintView = UIView()
        tintView.backgroundColor = UIColor(white: 0, alpha: 0.3) //change to your liking
        tintView.frame = CGRect(x: 0, y: 0, width: headerImage.frame.width, height: headerImage.frame.height)

        headerImage.addSubview(tintView)
        
        // TODO: Lab 6 Step 3c - Configure initial map area
        // 1) get longitude and latitude from coordinates property
        // test coordinates are being printed
        // 2) initialize coordinate point for restaurant
        // 3) initialize region object using restaurant's coordinates
        // 4) set region in mapView to be that of restaurants
        
        // TODO: Lab 6 Step 4b - Configure annotation
        // 5) instantiate annotation object to show pin on map
        // 6) set annotation's properties
        // 7) drop pin on map using restaurant's coordinates
    }
    
    // TODO: Lab 6 Step 5a-d - Configure annotation view using protocol method
    
    // TODO: Lab 6 Step 5e-f - Action to execute when user taps annotation views accessory buttons
    
    // TODO: Lab 6 Step 7b-c: Conform to PostImageViewDelegate protocol

    // Unwind segue after user finishes uploading image for map annotation
    @IBAction func unwind(_ seg: UIStoryboardSegue) {

    }
}
