//
//  FeedCell.swift
//  ssing
//
//  Created by 김승중 on 2016. 11. 7..
//  Copyright © 2016년 slogup. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    func setPreferredMaxLabelLayoutWidth(layoutWidth:CGFloat) {
        
        contentLabel.preferredMaxLayoutWidth = layoutWidth
    }
}
