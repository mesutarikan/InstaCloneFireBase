//
//  ViewController.swift
//  InstaCloneFireBase
//
//  Created by mesut  on 26.10.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil{
                    self.makeAlert(nameInput: "Error", messageInput: error?.localizedDescription ?? "Error3")
                }else {
                    self.performSegue(withIdentifier: "toFeedVc", sender: nil)
                    
                }
        }
        
        
        }else{
            makeAlert(nameInput: "Error", messageInput: "Error2")
        }
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authdats, error)in
                if error != nil{
                    self.makeAlert(nameInput: "Error", messageInput: error?.localizedDescription ?? "Error1")
                }else{
                    self.performSegue(withIdentifier: "toFeedVc", sender: nil)
                }
            }
            
        }else{
            makeAlert(nameInput: "Error", messageInput: "Username/password ?")
        }
    }
    func makeAlert(nameInput:String,messageInput:String){
        let alert = UIAlertController(title: nameInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}

