//
//  NetworkLokasi.swift
//  GITSNetwork
//
//  Created by Tri Rejeki on 29/03/19.
//  Copyright © 2019 GITS INDONESIA. All rights reserved.
//

import Alamofire

public enum NetworkLokasi: URLRequestConvertible {
    static let baseURLString = GITSApps.GetUrl()
    case doGetProvince(param: ProvinceParam)
    case doGetRegion(param: RegionalParam)
    
    var method: HTTPMethod {
        switch self {
        case .doGetProvince(_):
            return .get
        case .doGetRegion(_):
            return .get
        }
    }
    
    var res: (path: String, param: [String: Any]) {
        switch self {
        case .doGetProvince(let param):
            return ("v1/province", param.asParam())
        case .doGetRegion(let param):
            return ("v1/regency", param.asParam())
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var url: URL?
        var urlRequest: URLRequest?
        url = try NetworkLokasi.baseURLString.asURL()
        urlRequest = URLRequest(url: (url?.appendingPathComponent(res.path))!)
        urlRequest?.httpMethod = method.rawValue
        urlRequest = try URLEncoding.default.encode(urlRequest!, with: res.param)
        print("URL API => "+(urlRequest?.url?.absoluteString)!)
        print("Parameter => \(res.param)")
        return urlRequest!
    }
}
