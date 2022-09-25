//
//  PostListTableViewCell.swift
//  MVVM
//
//  Created by İlayda Metin on 22.09.2022.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private(set) weak var postTitleLabel: UILabel!
    
    @IBOutlet private(set) weak var postDescLabel: UILabel!
    @IBOutlet private(set) weak var postUserIdLbl: UILabel!
    
    @IBOutlet private(set) weak var postIdLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        containerView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        containerView.layer.cornerRadius = 8

    }
    
}
