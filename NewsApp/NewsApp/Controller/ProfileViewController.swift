//
//  ProfileViewController.swift
//  fireBaseApp
//
//  Created by يوسف جابر المالكي on 22/05/1443 AH.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!{
        didSet{
            profileImage.layer.borderColor = UIColor.systemBackground.cgColor
            profileImage.layer.borderWidth = 3.0
            profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        }
    }
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gitProfile = segue.destination as! RegisterViewController
        gitProfile.userImageView = profileImage
//        gitProfile.emailTextField.text = emailLable
    }
    @IBAction func handleLogout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandingNavigationController") as? UINavigationController {
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        } catch  {
            print("ERROR in signout",error.localizedDescription)
        }
        
    }

}
