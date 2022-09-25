//
//  PhotosCollectionViewCell.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}
