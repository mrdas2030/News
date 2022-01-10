//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 17/05/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {
    var selectedPost:Post?
    var selectedPostImage:UIImage?
//    @IBOutlet weak var postDescriptionLabel: UILabel!
    
    @IBOutlet weak var postDescriptionTextView: UITextView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!{
        didSet{
            postImageView.layer.cornerRadius = 30
        }
    }
    @IBOutlet weak var descriotionLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
                    title: "backButton".localized, style: .plain, target: nil, action: nil)
        
//        descriotionLable.text = "descriptionLable".localized
//        titleLable.text = "title".localized
        postDescriptionTextView.linkTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemBlue]
        postDescriptionTextView.isEditable = false
//        postDescriptionTextView.backgroundColor = .yellow
        postDescriptionTextView.isSelectable = true
        postDescriptionTextView.isUserInteractionEnabled = true
        postDescriptionTextView.dataDetectorTypes = .link

        if let selectedPost = selectedPost,
        let selectedImage = selectedPostImage{
            postTitleLabel.text = selectedPost.title
            postDescriptionTextView.text = selectedPost.description
            postImageView.image = selectedImage
        }
        // Do any additional setup after loading the view.
    }
}


