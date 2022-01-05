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
    var image = ["jb"]
    var videoChanell = ["العربية","الاخبارية","الحدث","الاخبارية","الاخبارية","الحدث","الاخبارية","الحدث"]
    var videoLive = ["بث مباشر🔴","بث مباشر🔴","بث مباشر🔴","بث مباشر🔴","بث مباشر🔴","بث مباشر🔴","بث مباشر🔴","بث مباشر🔴"]
    var videoUrl = ["https://www8.video2edit.com/dl/web7/download-file/c810c7ea-700d-489c-aa44-bb4562aa056f/IMG_3145.MP4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    ]
    
    
    
    @IBOutlet weak var videoTableView: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(
                    title: "backButton".localized, style: .plain, target: nil, action: nil)

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
//anmition
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
            cell.layer.transform = rotationTransform
            UIView.animate(withDuration: 1.0){
                
                cell.layer.transform = CATransform3DIdentity
            }
        }
    }
