//
//  DetailesNewsViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 24/05/1443 AH.
//

import UIKit
import WebKit
class DetailesNewsViewController: UIViewController {
    var urlLink : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSURL(string: urlLink!) != nil{
          wepView.load(NSURLRequest(url: NSURL(string: urlLink!)!as URL)as URLRequest)
        }else{
            print("URL not found")
        }
    }
    
    @IBOutlet weak var wepView: WKWebView!
    

}
