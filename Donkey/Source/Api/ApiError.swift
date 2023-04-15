//
//  ApiError.swift
//  ApiError
//
//  Created by Rex on 2021/8/8.
//

public struct ApiError:Decodable {
    public static let UNKNOWN_SERVER_ERROR = ApiError(errorCode: "500", errorMsg: "Internal Server Error")
    public static let UNKNOWN_API_REQUEST_ERROR = ApiError(errorCode: "E001", errorMsg: "Unknown Api Request Error")
    public var errorCode:String
    public var errorMsg: String
}
