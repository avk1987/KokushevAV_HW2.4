//
//  ProfileViewController.swift
//  KokushevAV_HW2.4
//
//  Created by Александр Кокушев on 07.03.2020.
//  Copyright © 2020 Александр Кокушев. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var usernameLabel: UILabel!
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientLayer()
        usernameLabel.text = "Hello \(username) 👋"
    }


    func createGradientLayer() {
        
        let gradientLayer = CAGradientLayer()
        let firstColor = UIColor(red: 0.988, green: 0.274, blue: 0.419, alpha: 1)
        let secondColor = UIColor(red: 0.247, green: 0.368, blue: 0.984, alpha: 1)
        gradientLayer.frame = view.bounds
            
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
}
