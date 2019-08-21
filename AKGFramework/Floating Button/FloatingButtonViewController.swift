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
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    private var showAKGMenu = false
    private var menuWidth: CGFloat!
    
    
    private let menus = ["btnContactUs", "btnSdkVersion", "btnBindAccount", "btnVerifyAccount", "btnLogOut", "btnEula", "btnFb"]
    private let titles = ["Contact Us", "SDK Version", "Bind Account", "Info Account", "Log out", "Eula", "FB Fanpage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib.init(nibName: "MenuView", bundle: Bundle(for: MenuCollectionViewCell.self)), forCellWithReuseIdentifier: "MenuCell")
    }
    
    init() {
        super.init(nibName: "FloatingButtonViewController", bundle: Bundle(for: FloatingButtonViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        self.menuWidth = (self.akgButton.bounds.size.width + self.collectionView.bounds.size.width)+32
        let akgButtonFrame = CGRect(x: 16, y: UIScreen.main.bounds.height-100, width: self.menuWidth!, height: 64)
        self.view.frame = akgButtonFrame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - IBActions
    @IBAction func akgButton(_ sender: Any) {
        if self.showAKGMenu {
            self.collectionView.isHidden = false
            self.closeButton.isHidden = false
            self.showAKGMenu = false
            
            let akgButtonFrame = CGRect(x: 16, y: UIScreen.main.bounds.height-100, width: self.menuWidth!, height: 44)
            self.view.frame = akgButtonFrame
        }else{
            self.collectionView.isHidden = true
            self.closeButton.isHidden = true
            self.showAKGMenu = true
            
            let akgButtonFrame = CGRect(x: 16, y: UIScreen.main.bounds.height-100, width: self.akgButton.bounds.size.width, height: 44)
            self.view.frame = akgButtonFrame
        }
    }
    
//    @IBAction func tapButton(_ sender: Any) {
//        self.basicAlertView(title: "", message: "TAP", successBlock: {})
//    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.remove()
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
        switch indexPath.row {
        case 0: // Contact Us
            
            let popupView = PopUpViewController()
            
            popupView.titleLabel.text = "Contact Us"
            popupView.contentLabel.text = "Contact us to our email admin@akggames.com"

            self.getTopMostViewController()?.add(popupView)

            break
        case 1: // SDK Version
            
            let popupView = PopUpViewController()
            popupView.titleLabel.text = "SDK VERSION"
            
            
            let nsObject: AnyObject? = Bundle(for: FloatingButtonViewController.self).infoDictionary?["CFBundleShortVersionString"] as AnyObject?
            let version = nsObject as! String
            
            popupView.contentLabel.text = "Your SDK’s Version is \(version)"
            
            self.getTopMostViewController()?.add(popupView)

            break
        case 2: // Bind Account
            

            break
        case 3: // Info Account
            

            break
        case 4: // Log Out
            
            let logoutView = LogoutViewController()
            self.getTopMostViewController()?.add(logoutView)
            
            break
        case 5: // Eula

            break
        case 6: // FB Fanpage

            break
            
        default:
            return
        }
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
