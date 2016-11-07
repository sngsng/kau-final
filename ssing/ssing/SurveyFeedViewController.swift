//
//  SurveyFeedViewController.swift
//  ssing
//
//  Created by 김승중 on 2016. 11. 7..
//  Copyright © 2016년 slogup. All rights reserved.
//

import UIKit

public enum FeedOrder {
    
    case ByPopularity
    case ByDistance
    
}

class SurveyFeedViewController: UIViewController {
    
    let defaultMargin = 10
    @IBOutlet weak var collectionView: UICollectionView!
    
    var feedOrder:FeedOrder!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpCollectionView()
        
        

    }
    
    private func setUpCollectionView() {
        
        collectionView.contentInset = UIEdgeInsets(top: CGFloat(defaultMargin), left: 0, bottom: CGFloat(defaultMargin), right: 0)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }

}



extension SurveyFeedViewController:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseCellIds.feedCell, for: indexPath) as! FeedCell
        
        cell.setPreferredMaxLabelLayoutWidth(layoutWidth: collectionView.bounds.width - 60)
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return defaultMargin
    }
}

extension SurveyFeedViewController:UICollectionViewDelegate {
    
    
}

extension SurveyFeedViewController:UICollectionViewDelegateFlowLayout {
    
    //func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    //    return CGSize(width: collectionView.bounds.width, height: 200)
    //}
    
}
