//
//  SignInDate.swift
//  week6_network
//
//  Created by 장혜령 on 2020/11/21.
//

import Foundation


//로그인에 성공했을 때 받아올 타입 생성
struct SignInData: Codable {
    let email, password, userName: String
}

struct SignUpData: Codable {
    let email, password, userName: String
}


