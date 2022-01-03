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
    @IBOutlet weak var nameTitleInProfile: UILabel!
    @IBOutlet weak var emailTitleInProfile: UILabel!
    
    @IBOutlet weak var changeLangungeLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTitleInProfile.text = "nameProfile".localized
        emailTitleInProfile.text = "emailProfile".localized
        changeLangungeLable.text = "changeLangunge".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "profile".localized
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
    
//    ==========================================swich langunge inside App=======\\
    @IBOutlet weak var languageSegmentControl: UISegmentedControl! {
        didSet {
            if let lang = UserDefaults.standard.string(forKey: "currentLanguage") {
                switch lang {
                case "ar":
                    languageSegmentControl.selectedSegmentIndex = 0
                case "en":
                    languageSegmentControl.selectedSegmentIndex = 1
                case "fr":
                    languageSegmentControl.selectedSegmentIndex = 2
                default:
                    let localLang =  Locale.current.languageCode
                     if localLang == "ar" {
                         languageSegmentControl.selectedSegmentIndex = 0
                     } else if localLang == "en"{
                         languageSegmentControl.selectedSegmentIndex = 1
                     }else {
                         languageSegmentControl.selectedSegmentIndex = 2
                     }
                
                }
            
            }else {
                let localLang =  Locale.current.languageCode
                 if localLang == "ar" {
                     languageSegmentControl.selectedSegmentIndex = 0
                 } else if localLang == "en"{
                     languageSegmentControl.selectedSegmentIndex = 1
                 }else {
                     languageSegmentControl.selectedSegmentIndex = 2
                 }
            }
        }
    }
    @IBAction func languageChanged(_ sender: UISegmentedControl) {
        if let lang = sender.titleForSegment(at:sender.selectedSegmentIndex)?.lowercased() {
            UserDefaults.standard.set(lang, forKey: "currentLanguage")
            Bundle.setLanguage(lang)
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "HomeNavigationController")
            }
        }
    }

}
