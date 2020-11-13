//
//  CollectionViewVC.swift
//  seminar3_mission_collectionView
//
//  Created by 장혜령 on 2020/11/05.
//

import UIKit

class CollectionViewVC: UITableViewController {

    
    @IBOutlet var partCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    var profiles: [Profile] = []
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    func setProfileData(){
        profiles.append(contentsOf: [
            Profile(imageName: "juhyeok", description: "#hereis#아요#내꿈은#사과농장#ENFP", name: "이주혁"),
        Profile(imageName: "nayeon", description: "#이제막학기 #여러분들이랑_친해지고_싶어요 #번개스터디환영", name: "김나연"),
            Profile(imageName: "peace", description: "#핸드피쓰 #이너피쓰 #배꼽도둑 #헬린이 #sson_peace7", name: "손평화"),
            Profile(imageName: "heesoo", description: "#총무꿈나무 #유총무 #현재_소식중 #풉", name: "유희수"),
            Profile(imageName: "saeeun", description: "#마 #아요는 #처음입니다", name: "박세은"),
            
        
        ])
    }

}


