//
//  NewsDetailPresent.swift
//  GITSHome
//
//  Created by Muhammad Rahman on 11/6/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework
import GITSNetwork

protocol NewsDetailRequest: BaseRequest {
    func doGetDetailNews(id: Int)
}

protocol NewsDetailResponse: BaseResponse {
    func displayDetailNews(result: NewsModel)
}

struct NewsDetailPresent: NewsDetailRequest {
    var output: NewsDetailResponse?
    
    func doGetDetailNews(id: Int) {
        NewsDetailWorker.doGetDetailNews(id: id, onSuccess: { (result) in
            self.output?.displayDetailNews(result: result)
        }) { (error) in
            self.output?.displayError(message: error, object: "Detail News")
        }
    }
}
