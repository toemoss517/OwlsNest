//
//  LoginVC.swift
//  OwlsNest
//
//  Created by Michael Thomas Russo on 8/4/19.
//  Copyright © 2019 Michael Thomas Russo. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.masksToBounds = true
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = pwdField.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error != nil {
                    // ADD CODE TO GIVE USER ERROR MESSAGE
                    print("nope")
                } else {
                    self.performSegue(withIdentifier: "ToSwipe", sender: nil)
                }
            })
        }
    }
    
}
