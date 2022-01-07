//
//  DetailesLiveVideoViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 04/06/1443 AH.
//

import UIKit
import WebKit
class DetailesLiveVideoViewController: UIViewController {
    var video:Video = Video()
    
    @IBOutlet var detailesLiveVideo: WKWebView!
    @IBOutlet var titleLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLable.text = video.title
        getLiveVideo(videoKey: video.key)
        // Do any additional setup after loading the view.
    }
    func getLiveVideo(videoKey:String){
        
        let url = URL(string: "https://www.youtube.com/embed/\(videoKey)")
        detailesLiveVideo.load(URLRequest(url: url!))
    }

 

}
