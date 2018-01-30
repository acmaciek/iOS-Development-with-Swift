//
//  ViewController.swift
//  Quick Bite
//
//  Created by Maciek Girek on 1/29/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!,password: passwordTextField.text!)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var newUser = User.init(uid: emailTextField.text!, email: emailTextField.text!, userName: nameTextField.text!)
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil { // If user exists perform the segue
                self.performSegue(withIdentifier: "segue1", sender: nil)
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) { //create new user
        Auth.auth().createUser(withEmail: emailTextField.text!,password: passwordTextField.text!) { user, error in
            if error == nil { //If there is no error Sign the user in
                Auth.auth().signIn(withEmail:self.emailTextField.text!,password:self.passwordTextField.text!)
            }
            else if (error != nil) {
                print(error!)
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

