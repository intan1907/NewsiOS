//
//  NetworkJadwal.swift
//  GITSNetwork
//
//  Created by Tri Rejeki on 27/03/19.
//  Copyright © 2019 GITS INDONESIA. All rights reserved.
//

import Alamofire

public enum NetworkJadwal: URLRequestConvertible {
    static let baseURLString = GITSApps.GetUrl()
    case doGetJadwal(param: JadwalParam)
    
    var method: HTTPMethod {
        switch self {
        case .doGetJadwal(_):
            return .post
        }
    }
    
    var res: (path: String, param: [String: Any]) {
        switch self {
        case .doGetJadwal(let param):
            return ("v1/jadwalShalat", param.asParam())
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var url: URL?
        var urlRequest: URLRequest?
        url = try NetworkJadwal.baseURLString.asURL()
        urlRequest = URLRequest(url: (url?.appendingPathComponent(res.path))!)
        urlRequest?.httpMethod = method.rawValue
        urlRequest = try JSONEncoding.default.encode(urlRequest!, with: res.param)
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("URL API => "+(urlRequest?.url?.absoluteString)!)
        print("Parameter => \(res.param)")
        return urlRequest!
    }
}
