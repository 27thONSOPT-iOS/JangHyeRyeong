//
//  NetworkResult.swift
//  week6_network
//
//  Created by 장혜령 on 2020/11/21.
//

import Foundation

// 서버 통신에 대한 결과(성공, 요청에러, 경로에러, 서버내부에러, 네트워크 연결 실패)
// 서버 통신에 따른 결과를 처리해주기 위한 열거형(enum)

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
