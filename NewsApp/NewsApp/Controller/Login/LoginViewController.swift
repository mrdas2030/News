//
//  loginViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 15/05/1443 AH.
//

import UIKit
import Firebase
class loginViewController: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passowrdLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var signInLable: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var newUserLable: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var errorLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextfield.delegate = self
        emailTextField.delegate = self
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "backButton".localized, style: .plain, target: nil, action: nil)
//        passwordTextfield.text = "passowrdTextField".localized
//        emailTextField.text = "emailTextField".localized
        passowrdLable.text = "passowrd".localized
        emailLable.text = "email".localized
        signInLable.text = "signlable".localized
        newUserLable.text = "newUser".localized
        signInButton.setTitle("signButton".localized, for: .normal)
        signUpButton.setTitle("signUpButton".localized, for: .normal)
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        // Do any additional setup after loading the view.
    }
    @IBAction func handleLogin(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextfield.text {
            Activity.showIndicator(parentView: self.view, childView: activityIndicator)
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error == nil {
                    print("Login succesfully")
                }else{
                    print(error?.localizedDescription as Any)
                    Activity.removeIndicator(parentView: self.view, childView: self.activityIndicator)
                    self.errorLable.text = error?.localizedDescription
                }
                
                if let _ = authResult {
                    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNavigationController") as? UITabBarController {
                        vc.modalPresentationStyle = .fullScreen
                        Activity.removeIndicator(parentView: self.view, childView: self.activityIndicator)
                        self.present(vc, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

extension loginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard return key
        return true
    }
}
