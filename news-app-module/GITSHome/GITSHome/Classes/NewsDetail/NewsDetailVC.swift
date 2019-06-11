//
//  NewsDetailVC.swift
//  GITSHome
//
//  Created by Muhammad Rahman on 11/6/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit
import GITSFramework
import GITSNetwork

class NewsDetailVC: BaseViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    
    var input: NewsDetailRequest?
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.input?.doGetDetailNews(id: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsDetailVC: NewsDetailResponse {
    
    func displayError(message: String, object: Any) {
        self.showMessage(message: message, error: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    func config(vc: NewsDetailVC) {
        var present = NewsDetailPresent.init()
        present.output = vc
        vc.input = present
    }
    
    func displayDetailNews(result: NewsModel) {
        // set view
        self.image = UIImageView(image: UIImage(named: "new_statesman_events")!)
        self.lbTitle.text = result.title!
        self.lbTime.text = "Published on \(result.date!) at \(result.time!)"
    }
}
