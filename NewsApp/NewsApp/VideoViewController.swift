//
//  VideoViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 27/05/1443 AH.
//

import UIKit
import AVKit

class VideoViewController: UIViewController {
    var playerViewController = AVPlayerViewController()
    var playerVew = AVPlayer()
    var videoChanell = ["العربية","الاخبارية","الحدث"]
    var videoLive = ["بث مباشر🔴","بث مباشر🔴","بث مباشر🔴"]
    var videoUrl = ["https://youtu.be/HYR7uidvXo4",
    "https://youtu.be/HYR7uidvXo4",
    "https://youtu.be/HYR7uidvXo4"
    ]
    
    
    
    @IBOutlet weak var videoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "live".localized
        videoTableView.delegate = self
        videoTableView.dataSource = self

        let nib = UINib(nibName: "playerVideoTableViewCell", bundle: nil)

        videoTableView.register(nib, forCellReuseIdentifier: "videoCell")
        // Do any additional setup after videoUrlloading the view.
    }
    



}
extension VideoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoChanell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as? playerVideoTableViewCell
        cell?.comminInit(nameChanell: videoChanell[indexPath.row], live: videoLive[indexPath.row], videoUrl: videoUrl[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playVideo(videoUrl: videoUrl[indexPath.row])
    }
    func playVideo(videoUrl:String){
        let url = URL(string: videoUrl)!
        playerVew = AVPlayer(url: url)
        playerViewController.player = playerVew
        self.present(playerViewController,animated: true)
        self.playerViewController.player?.play()
    }
    
    
    
}
