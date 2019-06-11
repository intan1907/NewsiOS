//
//  NewsDetailWorker.swift
//  GITSHome
//
//  Created by Muhammad Rahman on 11/6/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import Foundation
import GITSFramework
import GITSNetwork

struct NewsDetailWorker {
    
    static func doGetDetailNews(id: Int, onSuccess: @escaping (_ result: NewsModel)-> Void, onFailed: @escaping onError) {
        // dummy
        if (id == 0) {
            let model = NewsModel(title: "Global Digital Small Business Insurance Survey: This time it’s personal", date: "March 4, 2018", time: "11.11", image: nil, body:"Executive Summary Small and Medium-Sized Enterprises (SMEs) are the backbone of every economy. They account for 99% of all firms, 70% of employment, and between 50% and 60% of value added in the OECD. They are also one of the most dynamic sectors of the economy, with 97,000 new SMEs formed each year in the UK alone.")
            onSuccess(model)
        } else {
            let model = NewsModel(title: "‘The Shape of Water’ Wins Best Picture as Oscars Project Diversity", date: "March 3, 2018", time: "11.16", image: nil, body: "The 90th Academy Awards ceremony skittered between the serious and the silly on Sunday night, taking time both to acknowledge #MeToo and to hand out hot dogs at an adjacent movie theater, but the show ultimately emerged as a powerful call for inclusion and diversity in Hollywood.")
            onSuccess(model)
        }
    }
}
