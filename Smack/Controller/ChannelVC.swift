//
//  ChannelVC.swift
//  Smack
//
//  Created by Nickurey Huy Nguyen on 11/18/17.
//  Copyright © 2017 University Of Wollongong. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usernameLabel.text = UserDefaults.standard.string(forKey: USERNAME)
        if(UserDefaults.standard.bool(forKey: IS_USER_LOGGED_IN)){
            loginBtn.isHidden = true
        }
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }



}
