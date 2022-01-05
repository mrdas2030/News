//
//  LandingViewController.swift
//  NewsApp
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
        navigationItem.backBarButtonItem = UIBarButtonItem(
                    title: "backButton".localized, style: .plain, target: nil, action: nil)
        logInButton.setTitle("login".localized, for: .normal)
        regeterButton.setTitle("regester".localized, for: .normal)
        welcomeLable.text = "welcome".localized
        // Do any additional setup after loading the view.
    }
    

 
}
