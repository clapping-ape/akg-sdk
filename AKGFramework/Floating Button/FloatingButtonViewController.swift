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
    
    private var menus = ["btnVerifyAccount", "btnFb", "btnEula", "btnContactUs", "btnSdkVersion", "btnLogOut", "btnBindAccount"]
    private var titles = ["Info Account", "FB Fanpage", "Eula", "Contact Us", "SDK Version", "Log out", "Bind Account"]
    
    var startPosition: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib.init(nibName: "MenuView", bundle: Bundle(for: MenuCollectionViewCell.self)), forCellWithReuseIdentifier: "MenuCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)

    }
    
    func initView() {
        if DataManager.sharedInstance.getAuthProvider() == "guest" {
            self.menus = ["btnFb", "btnEula", "btnContactUs", "btnSdkVersion", "btnLogOut", "btnBindAccount"]
            self.titles = ["FB Fanpage", "Eula", "Contact Us", "SDK Version", "Log out", "Bind Account"]
            
        }else{
            self.menus = ["btnVerifyAccount", "btnFb", "btnEula", "btnContactUs", "btnSdkVersion", "btnLogOut"]
            self.titles = ["Info Account", "FB Fanpage", "Eula", "Contact Us", "SDK Version", "Log out"]
            
        }
        self.collectionView.reloadData()
        self.initFloatingButtonPosition()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initView()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func rotated() {
        self.initFloatingButtonPosition()
    }
    
    private func initFloatingButtonPosition() {
        self.menuWidth = self.akgButton.bounds.size.width + (CGFloat(50*self.menus.count))
        
        let akgButtonFrame = CGRect(x: 16, y: UIScreen.main.bounds.height-100, width: self.menuWidth!, height: 64)
        self.view.frame = akgButtonFrame
    }
    
    init() {
        super.init(nibName: "FloatingButtonViewController", bundle: Bundle(for: FloatingButtonViewController.self))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
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
            
            let akgButtonFrame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.menuWidth!, height: self.view.frame.size.height)
            self.view.frame = akgButtonFrame
        }else{
            self.collectionView.isHidden = true
            self.closeButton.isHidden = true
            self.showAKGMenu = true
            
            let akgButtonFrame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: 68, height: self.view.frame.size.height)
            self.view.frame = akgButtonFrame
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.remove()
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        
        self.getTopMostViewController()?.view.bringSubviewToFront(self.view)
        let translation = sender.translation(in: self.view)
        
//        if sender.state == .began {
//            startPosition = self.view.center
//        } else if sender.state == .changed {
//            let translation = sender.translation(in: self.view)
//            guard let start = self.startPosition else {
//                return
//            }
//
////            let newCenter = CGPoint(x: start.x + translation.x, y: start.y + translation.y)
//
//            let normX = max(min(translation.x / 150, 1), -1)
//            let deltaX = 50 * sin(normX) // add custom function here
//            let normY = max(min(translation.y / 150, 1), -1)
//            let deltaY = 50 * sin(normY) // add custom function here
//            let newCenter = CGPoint(x: start.x + min(deltaX, 50), y: start.y + min(deltaY, 50))
//
//            self.view.center = newCenter
//        } else {
//            startPosition = nil
//        }
        
        self.view.center = CGPoint(x: self.view.center.x + translation.x, y: self.view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
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
        
        let cell = collectionView.cellForItem(at: indexPath) as! MenuCollectionViewCell

        if cell.titleLabel.text == "Info Account" {
            let accountView = InfoAccountViewController()
            self.getTopMostViewController()?.add(accountView)
        }
        
        if cell.titleLabel.text == "FB Fanpage" {
            
        }
        
        if cell.titleLabel.text == "Eula" {
            
        }
        
        if cell.titleLabel.text == "Contact Us" {
            let popupView = PopUpViewController()
            
            popupView.titleLabel.text = "Contact Us"
            popupView.contentLabel.text = "Contact us to our email admin@akggames.com"
            
            self.getTopMostViewController()?.add(popupView)
        }
        
        if cell.titleLabel.text == "SDK Version" {
            let popupView = PopUpViewController()
            popupView.titleLabel.text = "SDK VERSION"
            
            
            let nsObject: AnyObject? = Bundle(for: FloatingButtonViewController.self).infoDictionary?["CFBundleShortVersionString"] as AnyObject?
            let version = nsObject as! String
            
            popupView.contentLabel.text = "Your SDK’s Version is \(version)"
            
            self.getTopMostViewController()?.add(popupView)
        }
        
        if cell.titleLabel.text == "Log out" {
            let logoutView = LogoutViewController()
            self.getTopMostViewController()?.add(logoutView)
        }
        
        if cell.titleLabel.text == "Bind Account" {
            let bindView = BindAccountViewController()
            bindView.callbackBindAccountWithPhone = { () -> Void in
                
                self.initView()
                
            }
            self.getTopMostViewController()?.add(bindView)
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
