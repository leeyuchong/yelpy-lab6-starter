//
//  PostImageViewController.swift
//  Yelpy
//
//  Created by German Flores on 7/8/20. Edited by Jason Lee on 3/20/22
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit

// TODO: Lab 6 Step 6a - Create Protocol for PostImageViewControllerDelegate

class PostImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var selectedImageView: UIImageView!
    
    // TODO: Lab 6 Step 6b - Add delegate for the protocol you created

    override func viewDidLoad() {
        super.viewDidLoad()
        createImagePicker()
        navigationController?.navigationBar.isHidden = true
    }
    
    // Unwind back to Restaurant Detail after uploading image
    @IBAction func onFinishPosting(_ sender: Any) {
        performSegue(withIdentifier: "unwindToDetail", sender: self)
        // TODO: Lab 6 Step 6c - Add delegate for the protocol you created
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[.originalImage] as! UIImage
        self.selectedImageView.image = originalImage
        dismiss(animated: true, completion: nil)
    }

    func createImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            imagePicker.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
}
