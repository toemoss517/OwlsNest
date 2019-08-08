//
//  UserVC.swift
//  OwlsNest
//
//  Created by Michael Thomas Russo on 8/4/19.
//  Copyright © 2019 Michael Thomas Russo. All rights reserved.
//

import UIKit

class UserVC: UIViewController {
    
    @IBOutlet weak var card: UIView!
    @IBOutlet var yearCollection: [UIButton]!
    @IBOutlet weak var chooseYearBtn: UIButton!
    @IBOutlet var collegeCollection: [UIButton]!
    @IBOutlet weak var chooseCollegeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card.layer.cornerRadius = 10
        card.layer.masksToBounds = true
        chooseYearBtn.layer.cornerRadius = 5
        chooseYearBtn.layer.masksToBounds = true
        yearCollection.forEach {
            (button) in button.layer.borderWidth = 1; button.layer.borderColor = #colorLiteral(red: 0, green: 0.1817905009, blue: 0.4327191114, alpha: 1)
        }
        chooseCollegeBtn.layer.cornerRadius = 5
        chooseCollegeBtn.layer.masksToBounds = true
        collegeCollection.forEach {
            (button) in button.layer.borderWidth = 1; button.layer.borderColor = #colorLiteral(red: 0, green: 0.1817905009, blue: 0.4327191114, alpha: 1)
        }
    }

    @IBAction func chooseYear(_ sender: UIButton) {
        yearCollection.forEach {
            (button) in button.isHidden = !button.isHidden
        }
    }
    
    @IBAction func yearTapped(_ sender: UIButton) {
        chooseYearBtn.setTitle(sender.titleLabel!.text, for: .normal)
        yearCollection.forEach {
            (button) in button.isHidden = !button.isHidden
        }
    }
    
    @IBAction func chooseCollege(_ sender: UIButton) {
        collegeCollection.forEach {
            (button) in button.isHidden = !button.isHidden
        }
    }
    
    @IBAction func collegeTapped(_ sender: UIButton) {
        chooseCollegeBtn.setTitle(sender.titleLabel!.text, for: .normal)
        collegeCollection.forEach {
            (button) in button.isHidden = !button.isHidden
        }
    }
}
