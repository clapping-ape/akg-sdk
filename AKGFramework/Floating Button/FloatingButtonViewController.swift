//
//  FloatingButtonViewController.swift
//  AKGFramework
//
//  Created by Lutfi Azhar on 17/08/19.
//  Copyright © 2019 Lutfi Azhar. All rights reserved.
//

import UIKit

class FloatingButtonViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var akgButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let menus = ["btnContactUs", "btnSdkVersion", "btnBindAccount", "btnVerifyAccount", "btnLogOut", "btnEula", "btnFb"]
    private let titles = ["Contact Us", "SDK Version", "Bind Account", "Info Account", "Log out", "Eula", "FB Fanpage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib.init(nibName: "MenuView", bundle: Bundle(for: MenuCollectionViewCell.self)), forCellWithReuseIdentifier: "MenuCell")
    }
    
    init() {
        super.init(nibName: "FloatingButtonViewController", bundle: Bundle(for: FloatingButtonViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        let width = self.akgButton.bounds.size.width + self.collectionView.bounds.size.width
        let akgButtonFrame = CGRect(x: 16, y: UIScreen.main.bounds.height-100, width: width+16, height: 44)
        self.view.frame = akgButtonFrame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBAction func tapButton(_ sender: Any) {
        self.basicAlertView(title: "", message: "TAP", successBlock: {})
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        
        let bundle = Bundle(for: FloatingButtonViewController.self)
        guard let image = UIImage(named: self.menus[indexPath.row], in: bundle, compatibleWith: nil) else {
            fatalError("Missing Image Resources")
        }
        
        cell.logoImageView.image = image
        cell.titleLabel.text = self.titles[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.bounds.size.height, height: self.collectionView.bounds.size.height)
        
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
