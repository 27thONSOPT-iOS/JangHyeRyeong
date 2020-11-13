//
//  PartCollectionViewVC.swift
//  seminar3_mission_collectionView
//
//  Created by 장혜령 on 2020/11/05.
//

import UIKit

class PartCollectionViewVC: UIViewController {
    @IBOutlet var partAlbumCollectionView: UICollectionView!
    
    var profiles: [Profile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileData()
        partAlbumCollectionView.delegate = self
        partAlbumCollectionView.dataSource = self
    
    }
    
    func setProfileData(){
        profiles.append(contentsOf: [
            Profile(imageName: "juhyeok", description: "#hereis#아요#내꿈은\n#사과농장#ENFP", name: "이주혁"),
            Profile(imageName: "nayeon", description: "#이제막학기 #여러분들이랑_친해지고_싶어요 #번개스터디환영", name: "김나연"),
            Profile(imageName: "peace", description: "#핸드피쓰 #이너피쓰 #배꼽도둑 #헬린이 #sson_peace7", name: "손평화"),
            Profile(imageName: "heesoo", description: "#총무꿈나무 #유총무 #현재_소식중 #풉", name: "유희수"),
            Profile(imageName: "saeeun", description: "#마 #아요는 #처음입니다", name: "박세은"),
            Profile(imageName: "wool", description: "#ENFP #STORM #울크박스 #@hwooolll #하늘콜렉터", name: "한울"),
            Profile(imageName: "hansol", description: "#고객중심#고객행동데이터기반한#UX디자이너#워너비,,", name: "김한솔"),
            Profile(imageName: "minju", description: "#디팟장 #개자이너 #최종목표는행복", name: "배민주"),
            Profile(imageName: "younghun", description: "#서팟짱 #솝트3회차 #앱잼_요리_개발자 #UX/UI", name: "최영훈"),
            Profile(imageName: "minguru", description: "#밍맹 #안팟장 #이래뵈도_귀여운거좋아함 #지박령 #허당", name: "강민구"),
            Profile(imageName: "yeonjeong", description: "#플레이스픽 #ENFJ #기획_디자인_개발_다", name: "이정연"),
            Profile(imageName: "junyeop", description: "#26기서버 #27기웹 #샵이_두개면_어떻게될까? ##", name: "홍준엽")
        ])
    }

}

extension PartCollectionViewVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
    
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderViewCell" , for: indexPath) as? HeaderViewCell else{
            return UICollectionViewCell()
        }
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartIntroCell", for: indexPath) as? PartIntroCell else {
            return UICollectionViewCell()
        }
        
        cell.setPartCell(profile: profiles[indexPath.row])
        return cell
    }
    
}

extension PartCollectionViewVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-75)/2 , height: 225)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 41, left: 24, bottom: 12, right: 24)
        
    }
     
}


