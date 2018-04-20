//
//  WaterViewController.swift
//  CalorieCounter
//
//  Created by Simó Fanna on 2018. 04. 17..
//  Copyright © 2018. Simó Fanna. All rights reserved.
//

import UIKit
import Firebase

class WaterViewController: UIViewController {
    
    var meals = [Water]()
    
    @IBOutlet weak var usernameField: UILabel!
    @IBOutlet weak var measureTapeImageView: UIImageView!
    var measureTapeImage:[UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        measureTapeImage = createImageArray(total: 11, imagePrefix: "measureTape")
    
        guard let currentUsername = Auth.auth().currentUser?.displayName else { return }
        usernameField.text = currentUsername
    }
    
    func createImageArray(total: Int, imagePrefix: String) -> [UIImage]{
        var imageArray: [UIImage] = []
        for imageCount in 0..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            imageArray.append(image)
        }
        return imageArray
    }
    
    func animate(imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.stopAnimating()
    }

    @IBAction func whenSaveTapped(_ sender: Any) {
        animate(imageView: measureTapeImageView, images: measureTapeImage)
    }
    
}
