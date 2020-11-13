//
//  Profile.swift
//  seminar3_mission_collectionView
//
//  Created by 장혜령 on 2020/11/05.
//

import UIKit

struct Profile{
    var imageName: String
    var description: String
    var name: String
    
    func makeImage() -> UIImage?{
        return UIImage(named: imageName)
    }
    
}
