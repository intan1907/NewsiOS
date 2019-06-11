//
//  HomeVC.swift
//  GITSHome
//
//  Created by IRFAN TRIHANDOKO on 10/06/19.
//  Copyright © 2019 IRFAN TRIHANDOKO. All rights reserved.
//

import UIKit
import GITSFramework
import GITSNetwork

class HomeVC: BaseViewController{
	@IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    
    var imgArr: [UIImage] = []
    var timer = Timer()
    var counter = 0

    var input: HomeRequest?
    var newsList: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configureView()
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.input?.doGetNews()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func changeImage() {
    
    	if counter < imgArr.count {
        	let index = IndexPath.init(item: counter, section: 0)
        	self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        	pageView.currentPage = counter
        	counter += 1
    	} else {
        	counter = 0
        	let index = IndexPath.init(item: counter, section: 0)
        	self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        	pageView.currentPage = counter
        	counter = 1
    	}
        
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func configureView() {
        self.tableView.register(UINib(nibName: "NewsCell", bundle: self.nibBundle), forCellReuseIdentifier: "NewsCell")
        self.reloadData()
    }
    
    func reloadData() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    //MARK: Show cel for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = NewsCell.instantiate(tableView, cellForRowAt: indexPath, data: newsList[indexPath.row])
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//            let data = self.newsList[indexPath.row]
//            self.delegate?.getContact(data: data)
//            self.navigationController?.popViewController(animated: true)
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        } 
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension HomeVC: HomeResponse {
    
    func displayError(message: String, object: Any) {
        self.showMessage(message: message, error: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    func config(vc: HomeVC) {
        var present = HomePresent.init()
        present.output = vc
        vc.input = present
    }
    
    func displayNews(result: [NewsModel]) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3, execute: {
            self.newsList = result
            self.reloadData()
        })
    }
}

