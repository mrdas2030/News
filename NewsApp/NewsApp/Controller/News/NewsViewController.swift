//
//  NewsViewController.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 24/05/1443 AH.
//

import UIKit

class NewsViewController: UIViewController {
    var newsAPI = NewsAPI()
    var articles = [Article(title: "", url: "")]
//    @IBOutlet weak var newsTitleLable: UILabel!
    @IBOutlet weak var NewsTableView: UITableView!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as! DetailesNewsViewController
        let selectedRow = NewsTableView.indexPathForSelectedRow?.row
        detailsVC.urlLink = articles[selectedRow!].url
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "backButton".localized, style: .plain, target: nil, action: nil)
//        navigationController?.navigationBar.prefersLargeTitles = true
//        title = "NewsVC".localized
        navigationItem.title = "NewsVC".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        NewsTableView.dataSource = self
        NewsTableView.delegate = self
        newsAPI.delegate = self
        newsAPI.fatchNews()
    }
}
extension NewsViewController :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
    
}
// send detailes
extension NewsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailesNews", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension NewsViewController:NewsAPIDelegate{
    func didFetchPosts(posts: Posts) {
        print(posts)
        articles = posts.articles
        DispatchQueue.main.async {
            self.NewsTableView.reloadData()
        }
    }
    func didFailWithError(error: Error?) {
        print(error!)
    }
}
