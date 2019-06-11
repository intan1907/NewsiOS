//
//  HomeWorker.swift
//  GITSHome
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework
import GITSNetwork

struct HomeWorker {
    static func doGetNews(onSuccess: @escaping (_ result: [NewsModel])-> Void, onFailed: @escaping onError) {
        var data: [NewsModel] = []
        
        // dummy
        let model1 = NewsModel(title: "Global Digital Small Business Insurance Survey: This time it’s personal", date: "March 4, 2018", image: nil)
        let model2 = NewsModel(title: "‘The Shape of Water’ Wins Best Picture as Oscars Project Diversity", date: "March 3, 2018", image: nil)
        
        data = [model1, model2]
        onSuccess(data)
    }
}
