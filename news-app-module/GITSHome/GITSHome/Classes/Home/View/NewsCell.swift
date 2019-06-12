//
//  NewsCell.swift
//  GITSHome
//
//  Created by Muhammad Rahman on 11/6/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit
import GITSNetwork

class NewsCell: UITableViewCell {
//    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension NewsCell {
    static func instantiate(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, data: NewsModel?) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
//        cell.imgNews.image = UIImage(named: data!.image ?? "") ?? nil
        cell.lbDate.text = data!.date ?? ""
        cell.lbTitle.numberOfLines = 0
        cell.lbTitle.text = data!.title ?? ""
        return cell
    }
}
