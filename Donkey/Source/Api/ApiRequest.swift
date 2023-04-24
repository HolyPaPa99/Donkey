//
//  ApiRequest.swift
//  ApiRequest
//
//  Created by Rex on 2021/8/5.
//

import Alamofire
import SwiftUI

public class ApiRequest {
    
    private static func handleResponse(_ response:AFDataResponse<Data?>,
                                       success: @escaping (_ data:Data?)->Void,
                                       failure: @escaping (_ error: ApiError)->Void){
        debugPrint("Response Status Code:--> \(response.response?.statusCode)")
        debugPrint("Response Data:--> \(String(decoding:response.data ?? Data(), as: UTF8.self))")
        switch response.response?.statusCode {
        case 200://success
            success(response.data)
            //500
        case 500:
            do{//business error
                guard let data = response.data else {//unknown error
                    failure(ApiError.UNKNOWN_SERVER_ERROR)
                    return
                }
                let error = try JSONDecoder().decode(ApiError.self, from: data)
                failure(error)
            }catch let er{ //unknown response format
                debugPrint("Api Request Error:\(er)")
                failure(ApiError.UNKNOWN_SERVER_ERROR)
            }
            //403
        case 403:
            debugPrint("403")
            //others
        default:
            debugPrint("Api Request Error:\(response.error?.errorDescription)")
            failure(ApiError.UNKNOWN_API_REQUEST_ERROR)
        }
    }
    
    public static func get<Parameters: Encodable>(_ convertible: URLConvertible,
                                                  parameters: Parameters? = nil,
                                                  success: @escaping (Data?)->Void,
                                                  failure: @escaping (ApiError)->Void) {
        debugPrint("ApiRequest.get->")
        debugPrint(convertible)
        debugPrint("parameter-> \(parameters)")
        AF.request(convertible, method: .get, parameters: parameters).response{ response in
            handleResponse(response, success: success, failure: failure)
        }
    }
    
    public static func get(_ convertible: URLConvertible,
                           success: @escaping (Data?)->Void,
                           failure: @escaping (ApiError)->Void) {
        debugPrint("ApiRequest.get->")
        debugPrint(convertible)
        AF.request(convertible, method: .get).response{ response in
            handleResponse(response, success: success, failure: failure)
        }
    }
    
    public static func post<Parameters: Encodable>(_ convertible: URLConvertible,
                                                   parameters: Parameters,
                                                   success: @escaping (Data?)->Void,
                                                   failure: @escaping (ApiError)->Void) {
        debugPrint("ApiRequest.post->")
        debugPrint(convertible)
        debugPrint("parameter-> \(parameters)")
        AF.request(convertible, method: .post, parameters: parameters).response{ response in
            handleResponse(response, success: success, failure: failure)
        }
    }
    public static func post(_ convertible: URLConvertible,
                            success: @escaping (Data?)->Void,
                            failure: @escaping (ApiError)->Void) {
        debugPrint("ApiRequest.post->")
        debugPrint(convertible)
        AF.request(convertible, method: .post).response{ response in
            handleResponse(response, success: success, failure: failure)
        }
    }
    
    public static func delete<Parameters: Encodable>(_ convertible: URLConvertible,
                                                     parameters: Parameters,
                                                     success: @escaping (Data?)->Void,
                                                     failure: @escaping (ApiError)->Void) {
        debugPrint("ApiRequest.delete->")
        debugPrint(convertible)
        debugPrint("parameter-> \(parameters)")
        AF.request(convertible, method: .delete, parameters: parameters).response{ response in
            handleResponse(response, success: success, failure: failure)
        }
    }
    
    public static func delete(_ convertible: URLConvertible,
                              success: @escaping (Data?)->Void,
                              failure: @escaping (ApiError)->Void) {
        debugPrint("ApiRequest.delete->")
        debugPrint(convertible)
        AF.request(convertible, method: .delete).response{ response in
            handleResponse(response, success: success, failure: failure)
        }
    }
    
    public static func upload() {
        
    }
}

