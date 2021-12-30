//
//  LandingViewController.swift
//  fireBaseApp
//
//  Created by يوسف جابر المالكي on 16/05/1443 AH.
//

import UIKit
import Firebase
class LandingViewController: UIViewController {

    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var regeterButton: UIButton!
    @IBOutlet weak var welcomeLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.setTitle("login".localized, for: .normal)
        regeterButton.setTitle("regester".localized, for: .normal)
        welcomeLable.text = "welcome".localized
        // Do any additional setup after loading the view.
    }
    

 
}
