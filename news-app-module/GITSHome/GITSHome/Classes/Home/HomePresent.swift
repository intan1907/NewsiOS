//
//  HomePresent.swift
//  GITSHome
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework
import GITSNetwork

protocol HomeRequest: BaseRequest {
    func doGetNews()
}

protocol HomeResponse: BaseResponse {
    func displayNews(result: [NewsModel])
}

struct HomePresent: HomeRequest {
    var output: HomeResponse?
    
    func doGetNews() {
        HomeWorker.doGetNews(onSuccess: { (result) in
            self.output?.displayNews(result: result)
        }) { (error) in
            self.output?.displayError(message: error, object: "News")
        }
    }
}
