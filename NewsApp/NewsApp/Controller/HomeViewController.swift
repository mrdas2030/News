//
//  ViewController.swift
//  fireBase
//
//  Created by يوسف جابر المالكي on 15/05/1443 AH.
//

import UIKit
import Firebase
class HomeViewController: UIViewController {
    var posts = [Post]()
    var favorits = [Favorit]()
    var selectedPost:Post?
    var selectedPostImage:UIImage?
    
    
    @IBOutlet weak var postsTableView: UITableView! {
        didSet {
            postsTableView.delegate = self
            postsTableView.dataSource = self
//            postsTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()
        // Do any additional setup after loading the view.
    }
    func getPosts() {
        let ref = Firestore.firestore()
        ref.collection("posts").order(by: "createdAt",descending: true).addSnapshotListener { snapshot, error in
            if let error = error {
                print("DB ERROR Posts",error.localizedDescription)
            }
            if let snapshot = snapshot {
                print("POST CANGES:",snapshot.documentChanges.count)
                snapshot.documentChanges.forEach { diff in
                    let postData = diff.document.data()
                    switch diff.type {
                    case .added :
                        
                        if let userId = postData["userId"] as? String {
                            ref.collection("users").document(userId).getDocument { userSnapshot, error in
                                if let error = error {
                                    print("ERROR user Data",error.localizedDescription)
                                    
                                }
                                if let userSnapshot = userSnapshot,
                                   let userData = userSnapshot.data(){
                                    let user = User(dict:userData)
                                    let post = Post(dict:postData,id:diff.document.documentID,user:user)
                                    self.postsTableView.beginUpdates()
                                    if snapshot.documentChanges.count != 1 {
                                        self.posts.append(post)
                                      
                                        self.postsTableView.insertRows(at: [IndexPath(row:self.posts.count - 1,section: 0)],with: .automatic)
                                    }else {
                                        self.posts.insert(post,at:0)
                                      
                                        self.postsTableView.insertRows(at: [IndexPath(row: 0,section: 0)],with: .automatic)
                                    }
                                  
                                    self.postsTableView.endUpdates()
                                    
                                    
                                }
                            }
                        }
                    case .modified:
                        let postId = diff.document.documentID
                        if let currentPost = self.posts.first(where: {$0.id == postId}),
                           let updateIndex = self.posts.firstIndex(where: {$0.id == postId}){
                            let newPost = Post(dict:postData, id: postId, user: currentPost.user)
                            self.posts[updateIndex] = newPost
                         
                                self.postsTableView.beginUpdates()
                                self.postsTableView.deleteRows(at: [IndexPath(row: updateIndex,section: 0)], with: .left)
                                self.postsTableView.insertRows(at: [IndexPath(row: updateIndex,section: 0)],with: .left)
                                self.postsTableView.endUpdates()
                            
                        }
                    case .removed:
                        let postId = diff.document.documentID
                        if let deleteIndex = self.posts.firstIndex(where: {$0.id == postId}){
                            self.posts.remove(at: deleteIndex)
                          
                                self.postsTableView.beginUpdates()
                                self.postsTableView.deleteRows(at: [IndexPath(row: deleteIndex,section: 0)], with: .automatic)
                                self.postsTableView.endUpdates()
                            
                        }
                    }
                }
            }
        }
    }
    // old bad way
    //    func getPosts() {
    //        let ref = Firestore.firestore()
    //        ref.collection("posts").addSnapshotListener { snapshot, error in
    //            if let error = error {
    //                print("DB ERROR Posts",error.localizedDescription)
    //            }
    //            if let snapshot = snapshot {
    //                for document in snapshot.documents {
    //                    let data = document.data()
    //                    if let userId = data["userId"] as? String {
    //                        ref.collection("users").document(userId).getDocument { userSnapshot, error in
    //                            if let error = error {
    //                                print("ERROR user Data",error.localizedDescription)
    //
    //                            }
    //                            if let userSnapshot = userSnapshot,
    //                               let userData = userSnapshot.data(){
    //                                let user = User(dict:userData)
    //                                let post = Post(dict:data,id:document.documentID,user:user)
    //                                self.posts.append(post)
    //                                DispatchQueue.main.async {
    //                                    self.postsTableView.reloadData()
    //                                }
    //
    //                            }
    //                        }
    //
    //                    }
    //                }
    //            }
    //        }
    //    }
//    @IBAction func handleLogout(_ sender: Any) {
//        do {
//            try Auth.auth().signOut()
//            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandingNavigationController") as? UINavigationController {
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//            }
//        } catch  {
//            print("ERROR in signout",error.localizedDescription)
//        }
//
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toPostVC" {
                let vc = segue.destination as! PostViewController
                vc.selectedPost = selectedPost
                vc.selectedPostImage = selectedPostImage
            }else {
                let vc = segue.destination as! DetailsViewController
                vc.selectedPost = selectedPost
                vc.selectedPostImage = selectedPostImage
            }
        }
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PostTableViewCell
        return cell.configure(with: posts[indexPath.row])
    }
    
    
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        selectedPostImage = cell.postImageView.image
        selectedPost = posts[indexPath.row]
        if let currentUser = Auth.auth().currentUser,
           currentUser.uid == posts[indexPath.row].user.id{
            performSegue(withIdentifier: "toPostVC", sender: self)
        }else {
            performSegue(withIdentifier: "toDetailsVC", sender: self)
            
        }
    }
}

