//
//  AboutMeViewController.swift
//  KokushevAV_HW2.4
//
//  Created by Александр Кокушев on 08.03.2020.
//  Copyright © 2020 Александр Кокушев. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var yearsLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userData = getUserData()
        nameLabel.text = userData["Name"]
        yearsLabel.text = userData["Years"]
        cityLabel.text = userData["City"]
        hobbyLabel.text = userData["Hobby"]
        
        
    }
    
    private func getUserData() -> [String: String] {
        let userData = ["Name": "Alexander",
                        "Years": "32",
                        "City": "Ekaterinburg",
                        "Hobby": "Fishing, sports trip"]
        return userData
    }
    
}
