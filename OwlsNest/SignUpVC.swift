//
//  SignUpVC.swift
//  OwlsNest
//
//  Created by Michael Thomas Russo on 8/6/19.
//  Copyright © 2019 Michael Thomas Russo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpVC: UIViewController {

    @IBOutlet var yearCollection: [UIButton]!
    @IBOutlet weak var chooseYearBtn: UIButton!
    @IBOutlet var collegeCollection: [UIButton]!
    @IBOutlet weak var chooseCollegeBtn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var majorField: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
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
    
    @IBAction func continueTapped(_ sender: Any) {
        guard let email = emailField.text, email != "" else {
            // ADD CODE TO GIVE USER ERROR MESSAGE
            print("email error")
            return
        }
        
        guard let pwd = pwdField.text, pwd != "" else {
            // ADD CODE TO GIVE USER ERROR MESSAGE
            print("password error")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user,error) in
            if error != nil {
                print("cant create user \(String(describing: error))")
            } else {
                self.ref.child("emails").setValue(["email": email])
            }
        })
    }
    
}
