//
//  PostListEntity.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import Foundation

struct PostCellViewModel {
    var title:String?
    var desc: String?
    var userId: Int?
    var id: Int?
}

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
