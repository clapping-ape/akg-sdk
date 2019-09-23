//
//  BannerViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 23/09/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class BannerViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    private var banners: [Banner] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bannerCollectionView.register(UINib.init(nibName: "BannerCollectionViewCell", bundle: Bundle(for: BannerViewController.self)), forCellWithReuseIdentifier: "BannerCell")
        
        APIManager.sharedInstance.bannersAPI(callBack: { (banners) in
            
            self.banners = banners
            self.bannerCollectionView.reloadData()
            
        }) { (message) in
            self.basicAlertView(title: "", message: message, successBlock: {})
        }
    }
    
    init() {
        super.init(nibName: "BannerViewController", bundle: Bundle(for: BannerViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.remove()
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCollectionViewCell
        
        let banner = self.banners[indexPath.row]
        let imageURL = banner.cover_image_url!
        
        if imageURL != "" {
            NetworkRequest.sharedInstance.getImageURL(StringURL: imageURL, successBlock: { (image) in
                
                DispatchQueue.main.async() {
                    cell.bannerImageView.image = image
                }
                
            }) { (message) in
                self.basicAlertView(title: "", message: message, successBlock: {})
            }
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
