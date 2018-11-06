//
//  SignUpVC.swift
//  MinionLogin
//
//  Created by MANAS VIJAYWARGIYA on 01/09/18.
//  Copyright © 2018 MANAS VIJAYWARGIYA. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signupTapped(_ sender: Any) {
//        displayPopUp(title: "Test", message: "Test was successful")
        
        if email.text == "" || password.text == "" {
            displayPopUp(title: "Missing INFO", message: "No Fields can be empty.")
        }else{
            //create User
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                if error != nil{
                    if let myErr = error?.localizedDescription {
                        self.displayPopUp(title: "Error", message: myErr)
                    }
                }else{
                    //print(user)
                    //Enter user in DB as well
                    Database.database().reference().child("users").child(user!.user.uid).child("email").setValue(self.email.text!)
                    
                    
                    self.displayPopUp(title: "Success", message: "Now, you can login")
                }
            }
            
        }
    }
    
    func displayPopUp(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController,animated: true,completion: nil)
    }
}
