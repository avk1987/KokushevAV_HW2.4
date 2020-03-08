//
//  ViewController.swift
//  KokushevAV_HW2.4
//
//  Created by Александр Кокушев on 05.03.2020.
//  Copyright © 2020 Александр Кокушев. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userNameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var forgoutUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.delegate = self
        passwordField.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        let destinationVC = tabBarController.viewControllers?.first as! ProfileViewController
        
        
        destinationVC.username = userNameField.text ?? ""
        
    }
    
    @IBAction func loginButtonPressed() {
        
        guard let username = userNameField.text else { return }
        guard let password = passwordField.text else { return }
        
        if checkAuth(username: username, password: password) {
            performSegue(withIdentifier: "goToProfile", sender: nil)
        }
        
    }
    
    @IBAction func signOutPressed(segue: UIStoryboardSegue){
        
        userNameField.text = ""
        passwordField.text = ""
        
    }
    
    
    @IBAction func restoreAccessButtonPressed(_ sender: UIButton) {
        
        if sender === forgoutUserNameButton {
            RestoreAccess(restoreThrough: "Username")
        } else if sender === forgotPasswordButton {
           RestoreAccess(restoreThrough: "Email")
        }
    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField === userNameField {
            passwordField.becomeFirstResponder()
        } else if textField === passwordField {
            loginButtonPressed()
        }
        
        return true
    }
    
    private func RestoreAccess(restoreThrough: String) {
        //По хорошему тут бы большинство стрингов на enum заменить
        let alert = UIAlertController(title: "Please enter your \(restoreThrough)", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your \(restoreThrough)"
        })
        
        alert.addAction(UIAlertAction(title: "OK", // Громоздко вышло...
            style: .default,
            handler: { action in
                let whatSened = restoreThrough == "Username" ? "Username" : "Password"
                self.showAlert(alertMessage: "\(whatSened) will be sent to your email",
                    alertTitle: "Forgot \(whatSened)")}))
        
        self.present(alert, animated: true)
    }
    
    private func showAlert(alertMessage: String, alertTitle: String) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
        self.present(alert, animated: true)
        
    }
    
    private func checkAuth(username: String, password: String) -> Bool {
        
        if username.isEmpty {
            showAlert(alertMessage: "Field Username is empty", alertTitle: "Error")
            return false
        } else if password.isEmpty {
            showAlert(alertMessage: "Field Password is empty", alertTitle: "Error")
            passwordField.text = ""
            return false
        }
        
         
        let user = User(userName: "Alex", password: "12345")
        
        if !(user.userName == username && user.password == password) {
            showAlert(alertMessage: "Username or password is incorrect", alertTitle: "Error")
            return false
        }
        
        return true
    }
    

    
    
    
}

