//
//  PhotosEntity.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import Foundation

struct PhotosCellViewModel {
    var url: String?
    var thumbnailUrl: String?
    var title: String?
}

struct Photos: Decodable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: String?
 
}
