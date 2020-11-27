//
//  GenericResponse.swift
//  week6_network
//
//  Created by 장혜령 on 2020/11/21.
//

import Foundation

//Codable프로토콜 -> json 인코딩,디코딩
//T : 제너럴타입

struct GenericResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: T?   // data를 통해 들어올 타입도 만들어 줌
    
    //JSON 데이터의 키와 swift struct의 변수를 맵핑하는 역할
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    
    //data에 대한 키값이 있는 경우와 없는 경우를 모두 처리하는 역할
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
    
}
