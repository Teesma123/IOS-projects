//
//  TCNewsListModel.swift
//  TechCrunch
//
//  Created by Amil Freight on 18/08/22.
//

import Foundation
//MARK: - TCNewsListModel
struct TCNewsListModel : Codable{
    let status : String?
    let totalResults : Int?
    let articles : [Articles]
}

struct Articles : Codable{
    let author : String?
    let title  : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?

}


