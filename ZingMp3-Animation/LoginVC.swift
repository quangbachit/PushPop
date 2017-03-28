//
//  LoginVC.swift
//  ZingMp3-Animation
//
//  Created by Quang Bach on 3/27/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    var users = ["login":"123","bach":"123","vn":"123"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(users)
        
    }
    
    
    
    @IBAction func login(){
        
        if passTF.text == "" || emailTF.text == "" {
            alertController(title: "FAIL", message: "Not Import Information")
            
        } else if let pass = users[emailTF.text!] {
            
            if passTF.text != pass {
                alertController(title: "FAIL", message: "password not true")
            } else {
                let v2 = self.storyboard?.instantiateViewController(withIdentifier: "V2") as! Math
                self.navigationController?.pushViewController(v2, animated: true)
            }
            
        } else {
            alertController(title: "Error", message: "Account does not exist")
        }
    }
    
    
    @IBAction func register(){
        if passTF.text == "" || emailTF.text == "" {
            alertController(title: "FAIL", message: "Not Import Information")
            
        } else if let email = users[emailTF.text!] {
            alertController(title: "FAIL", message: "Account already exists")
        } else {
            users[emailTF.text!] = passTF.text!
            alertController(title: "Success", message: "Sign Up Success")
            print(users)
        }
    }
    
    @IBAction func edit() {
        if passTF.text == "" || emailTF.text == "" {
            alertController(title: "FAIL", message: "Not Import Information")
            
        } else if let pass = users[emailTF.text!]{
            users[emailTF.text!] = passTF.text!
            alertController(title: "Done", message: "Edit Success with \(emailTF.text!)")
            print(users)
        } else {
            alertController(title: "Error", message: "Account does not exist")
        }
    }
    @IBAction func remove(){
        if passTF.text == "" || emailTF.text == "" {
            alertController(title: "FAIL", message: "Not Import Information")
        }else if let pass = users[emailTF.text!]{
            users.removeValue(forKey: emailTF.text!)
            alertController(title: "Remove", message: "Remove \(emailTF.text!)")
            print(users)
        }else {
            alertController(title: "Error", message: "Account does not exist")
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertController(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: {
            
        })
        
    }

}
