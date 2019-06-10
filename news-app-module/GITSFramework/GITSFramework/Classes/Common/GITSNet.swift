//
//  GITSNet.swift
//  GITSFramework
//
//  Created by GITS Indonesia on 3/16/17.
//  Copyright © 2017 GITS Indonesia. All rights reserved.
//

import Foundation
import GITSRest
import Alamofire
import SwiftyJSON


let SUCCESS = "success"
let NETWORK_ERROR = "Tidak ada koneksi"
let SYSTEM_ERROR = "Terjadi kesalahan sistem"

public typealias onError = (_ message: String)-> Void

extension GITSRestError {
    var message : String {
        switch self {
        case .serverFailure( _, let message):
            return message
        case .timeout:
            return "Request timeout"
        case .unauthorized:
            return "Unauthorized"
        case .unknown:
            return "Oops! Something went wrong..."
        }
    }
}

public struct GITSNet {
    
    public static func getToken()-> String {
//        if let token = GITSPref.getLogin()?.accessToken, token != "" {
//            return token
//        } else {
//            return "feb8ea0e1b2ab2b2ab534665ff5019bd2ebc154a"
//        }
        return ""
    }
    
    public static func request(
        request:URLRequestConvertible,
        onSuccess:@escaping (_ response:JSON) -> Void,
        onFailure:@escaping (_ response:String) -> Void) {
        
        let req:URLRequest?
        do {
            req = try request.asURLRequest()
        } catch  {
            req = nil
        }
        
        _ = GITSRest.runRequest(urlRequest: req!, jsonValidation: { json in
            return nil
        }) { error,json in
            if error == nil {
                print("JSON Result => \(String(describing: json!))" )
                onSuccess(json!)
            }else if let err = error {
                print("JSON Error => \(err.message)" )
                onFailure(err.message)
            }
        }
        
    }
    
    public static func uploadRequest(
        request: URLRequestConvertible,
        multipartFormData: @escaping (MultipartFormData) -> Void,
        onSuccess:@escaping (_ response:JSON) -> Void,
        onFailure:@escaping (_ response:String) -> Void) {
        let req:URLRequest?
        do {
            req = try request.asURLRequest()
        } catch  {
            req = nil
        }
        
        upload(multipartFormData: multipartFormData, with: req!) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _ ):
                upload.responseJSON {
                    response in
                    if response.result.error == nil {
                        let json = JSON(response.result.value!)
                        print(json)
                        print("=====RESPONSE JSON=====")
                        onSuccess(json)
                    } else{
                        onFailure("Oops! No internet found. Check your connection or try again.")
                    }
                }
            case .failure(let encodingError):
                print("===Failure Encoding===")
                print(encodingError)
                onFailure(encodingError.localizedDescription)
            }
        }
    }
}
