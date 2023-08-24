//
//  ViewController.swift
//  TechCrunch
//
//  Created by Amil Freight on 18/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func letsStartButtonAction(_ sender: UIButton) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.animateView(sender)
        }
        let tabBar = VCMainTabBarViewController()
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true)
    }
    
    private func animateView(_ viewToAnimate : UIView) {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            },completion: nil)
        }
    }
    
  
    
}

