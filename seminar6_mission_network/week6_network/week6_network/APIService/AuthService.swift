//
//  AuthService.swift
//  week6_network
//
//  Created by 장혜령 on 2020/11/21.
//

import Foundation
import Alamofire

struct AuthService{
    
    //static lab shared
    //싱글톤 객체로 앱 어디서든 접근 가능
    static let shared = AuthService()
    
    //하나의 객체를 만들어 여러 화면에서 볼 수 있도록
    //로그인 통신에 대한 함수 정의
    //실제 앱 로그인 화면에서 사용자가 email, pw 입력 후 로그인 버튼 눌렀을 때 실행할 함수
    //ios - noescaping default
    func signIn(email : String, password : String, completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        // 통신 URL
        let url = APIConstants.usersSignInURL
        
        // 요청 헤더
        let header: HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        
        //요청 바디
        let body: Parameters = [
            "email" : email,
            "password":password
        ]
        
        
        //원하는 형식의 HTTP request 생성
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in // response : 통신 결과
            
            switch response.result { // 통신 결과에 따라 statusCode와 value 값을 가지게 된다
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                //Completion이란 클로져에게 전달할 데이터를 judgeSignInData 함수를 통해 결정
                completion(judgeSignInData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
        
    }
    
    func signUp(email: String, password: String, userName: String, completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        //요청 URL, 헤더, 바디
        let url = APIConstants.usersSignUpURL
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "email" : email,
            "password" : password,
            "userName" : userName
        ]
        
        //원하는 형식의 HTTP Request 생성
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in
            switch response.result{
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                //Completion이란 클로져에게 전달할 데이터를 judgeSignInData 함수를 통해 결정
                completion(judgeSignUpData(status: statusCode, data: data))
            
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
        
        
    }
    
    
    
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any>{
       
        //통신을 통해 전달받은 데이터 decode
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignInData>.self, from: data) else {
            return .pathErr
        }
        
        //statusCode를 통해 통신 결과를 알 수 있음
        switch status {
        case 200:
            return .success(decodedData.data) // 성공했다는 결과와 함계 decode한 data 값도 전달
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    
    private func judgeSignUpData(status: Int, data: Data) -> NetworkResult<Any>{
       
        //통신을 통해 전달받은 데이터 decode
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SignUpData>.self, from: data) else {
            return .pathErr
        }
        
        //statusCode를 통해 통신 결과를 알 수 있음
        switch status {
        case 200:
            return .success(decodedData.data) // 성공했다는 결과와 함계 decode한 data 값도 전달
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
