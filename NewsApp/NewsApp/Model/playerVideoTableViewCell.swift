//
//  playerVideoTableViewCell.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 27/05/1443 AH.
//

import UIKit
import AVKit
class playerVideoTableViewCell: UITableViewCell {
    @IBOutlet weak var nameChanellLable: UILabel!
    @IBOutlet weak var liveLable: UILabel!
    @IBOutlet weak var thumbnilImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func comminInit(nameChanell:String, live :String,videoUrl:String){
        self.nameChanellLable.text = nameChanell
        self.liveLable.text = live
        let url = URL(string:videoUrl)
        self.gitThumbnailFromVideoUrl(url: url!) { (thumbnilImage) in
            self.thumbnilImageView.image = thumbnilImage
        }
        
    }
    func gitThumbnailFromVideoUrl(url:URL, completion:@escaping((_ image :UIImage?)->Void)) {
        DispatchQueue.global().async {
//            let asset = AVAsset()
//            let avAssetImageGenaratore = AVAssetImageGenerator(asset: asset)
//            avAssetImageGenaratore.appliesPreferredTrackTransform = true
//            let thompnailTime = CMTimeMake(value: 2, timescale: 2)

            do {
//                let cgThombImage = try avAssetImageGenaratore.copyCGImage(at: thompnailTime, actualTime: nil)
//                let thombImage = UIImage(cgImage: cgThombImage)
                DispatchQueue.main.async {
//                    completion(thombImage)
                }
//            }catch{
//                print(error.localizedDescription)
            }
        }
    }


}
