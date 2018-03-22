//
//  ViewController.swift
//  SideMenu
//
//  Created by ODA on 22/03/18.
//  Copyright © 2018 ODA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var initialView: UIView!
    @IBOutlet var selectedImage: UIImageView!
    @IBOutlet var selectedText: UILabel!
    
    let transition = FrameTransition()
    
    @IBOutlet var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func actionShowMenu(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let sideMenuVC = storyBoard.instantiateViewController(withIdentifier: "SideMenuSBID") as! SideMenuVC
        sideMenuVC.transitioningDelegate = self
        sideMenuVC.modalPresentationStyle = .custom
        sideMenuVC.onSelected = onSelected
        
        self.present(sideMenuVC, animated:true, completion:nil)
    }

    func onSelected(_ data:MenuItem) -> () {
        initialView.isHidden = true
        selectedText.text = "Selected ".appending(data.nameString)
        selectedImage.image = UIImage(named: data.iconString)
    }
}



extension ViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = CGPoint(x: 0, y: 0)
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = CGPoint(x: 0, y: 0)
        return transition
    }
}
