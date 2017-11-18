//
//  ChatVC.swift
//  Smack
//
//  Created by Nickurey Huy Nguyen on 11/18/17.
//  Copyright © 2017 University Of Wollongong. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController, action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        // Do any additional setup after loading the view.
    }


}
