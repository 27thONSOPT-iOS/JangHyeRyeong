//
//  PartIntroCell.swift
//  seminar3_mission_collectionView
//
//  Created by 장혜령 on 2020/11/05.
//

import UIKit

class PartIntroCell: UICollectionViewCell {
    static let identifier = "PartIntroCell"
    
    @IBOutlet var partLeaderImageView: UIImageView!
    @IBOutlet var partLeaderName: UILabel!
    @IBOutlet var hashTagLabel: UILabel!
    
    func setPartCell(profile: Profile){
        partLeaderName.text = profile.name
        hashTagLabel.numberOfLines = 0;
        hashTagLabel.text = profile.description
        partLeaderImageView.image = profile.makeImage()
    }
    
}
