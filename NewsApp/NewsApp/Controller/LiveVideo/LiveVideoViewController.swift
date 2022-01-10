//
//  LiveVideoViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 04/06/1443 AH.
//

import UIKit

class LiveVideoViewController: UIViewController {
    
    var videos :[Video] = []
    var video:Video = Video()
    var image1 = ["33","11","22"]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "liveVideo".localized

//        العربية
        let vides = Video()
        vides.key = "HYR7uidvXo4"
        vides.title = "Al-Arabiya Livestream العربية البث الحي المباشر"
//        vides.image = UIImage(named: "Image Dark")
        videos.append(vides)
//        الاخبارية
        let vides2 = Video()
        vides2.key = "cCe_bZsj7m4"
        vides2.title = " بث مباشر قناة الاخبارية"
//        vides.image = UIImage(named: "Image Dark")
        videos.append(vides2)
//        الحدث
        let vides3 = Video()
        vides3.key = "u8BgCFn9Mic"
        vides3.title = "البث المباشر لقناة الحدث AlHadath Live Stream"
//        vides.image = UIImage(named: "images-2")
        videos.append(vides3)
        // Do any additional setup after loading the view.
    }
    

   

}
extension LiveVideoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "liveVideoCell", for: indexPath) as! LiveVideTableViewCell
        cell.TitleVideoLiveLable.text = videos[indexPath.row].title
        cell.comminInit(image:UIImage(imageLiteralResourceName:image1[indexPath.row]))
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vi = videos[indexPath.row]
        self.video = vi
        performSegue(withIdentifier: "toLive", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLive"{
            let vc = segue.destination as! DetailesLiveVideoViewController
            vc.video = self.video
        }
    }

    
}
class Video{
    var key:String = ""
    var title:String = ""

    
}

extension UIImageView{
    func downloaded(from url:URL,contentMode mode:UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse,httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType,mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data:data)
            else {return}
            DispatchQueue.main.async {
                self.image = image
            }
                        
        }.resume()
    }
    func downlodedVideo(from link :String,contetMode mode:UIView.ContentMode = .scaleAspectFit){
        guard let url = URL(string: link) else {return}
        downloaded(from: url, contentMode: mode)
    }
}
