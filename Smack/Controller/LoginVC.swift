//
//  LoginVC.swift
//  Smack
//
//  Created by Nickurey Huy Nguyen on 11/18/17.
//  Copyright © 2017 University Of Wollongong. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func login(_sender: Any){
        let username = usernameTextField.text!
        let password = passwordTextField.text!.get_sha256_String()
        
        print(password)
        Alamofire.request(LOGIN,method: .post, parameters: ["username": username,"password": password]).responseString{
            response in
            print(response)
            let statusCode = response.response?.statusCode
            if(statusCode == 200){
                UserDefaults.standard.set(true, forKey: IS_USER_LOGGED_IN)
                UserDefaults.standard.set(username, forKey: USERNAME)
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil)
            }else{
                self.errorLabel.textColor = UIColor.red
                self.errorLabel.text = response.result.value
            }
            
        }
    }
    

}
