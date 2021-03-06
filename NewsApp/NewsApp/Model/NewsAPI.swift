//
//  NewsAPI.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 24/05/1443 AH.
//

import Foundation
//1- create Url
//2- create Url Session
//3- create Task
//4- Resum task
protocol NewsAPIDelegate{
    func didFetchPosts (posts:Posts)
    func didFailWithError (error:Error?)
}
struct NewsAPI {
    var delegate:NewsAPIDelegate?
    func fatchNews(){
        //1- create Url
        let urlString = "https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=9f5b86dd95d74249ade4d42e9a329972"
        let url = URL(string: urlString)
        //2- create Url Session
        let urlSession = URLSession(configuration: .default)
        //3- create Task
        let task = urlSession.dataTask(with: url!) {  (data,urlResponse, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
            }else {
                do {
                    let thisPosts = try JSONDecoder().decode(Posts.self, from: data!)
                    delegate?.didFetchPosts(posts: thisPosts)
                }catch{
                    print(error)
                }
            }
        }
        //4- Resum task
        task.resume()
    }
}

