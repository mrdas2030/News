//
//  postsNews.swift
//  NewsApp
//
//  Created by يوسف جابر المالكي on 24/05/1443 AH.
//

import Foundation
struct Posts: Decodable {
    let status : String
    let totalResults: Int
    let articles :[Article]
}
struct Article:Decodable{
    let title:String
    let url:String
}
