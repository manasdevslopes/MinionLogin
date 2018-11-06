//
//  ViewController.swift
//  MinionLogin
//
//  Created by MANAS VIJAYWARGIYA on 01/09/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVc: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        if email.text == "" || password.text == "" {
            displayPopUp(title: "Missing INFO", message: "No Fields can be empty.")
        }else{
            //sign In
            Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: { (user, error) in
                if error != nil{
                    if let myErr = error?.localizedDescription {
                        self.displayPopUp(title: "ERROR", message: myErr)
                    }
                }else{
                    //perform login && Segue to other screen
                    print("############")
                    //print(user as Any)
                    self.performSegue(withIdentifier: "successsegue", sender: nil)
                }
            })
        }
    }
    
    
    func displayPopUp(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
}

