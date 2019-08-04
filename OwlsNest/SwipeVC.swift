//
//  SwipeVC.swift
//  OwlsNest
//
//  Created by Michael Thomas Russo on 8/4/19.
//  Copyright © 2019 Michael Thomas Russo. All rights reserved.
//

import UIKit

class SwipeVC: UIViewController {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var thumb: UIImageView!
    
    var divisor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card.layer.cornerRadius = 10
        card.layer.masksToBounds = true
        divisor = (view.frame.width / 2) / 0.61
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let scale = min(100 / abs(xFromCenter), 1)
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor).scaledBy(x: scale, y: scale)
        
        if xFromCenter > 0 {
            thumb.image = #imageLiteral(resourceName: "thumbUp")
            thumb.tintColor = UIColor.green
        } else {
            thumb.image = #imageLiteral(resourceName: "thumbDown")
            thumb.tintColor = UIColor.red
        }
        
        thumb.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            if card.center.x < 75 {
                // move off left
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            } else if card.center.x > (view.frame.width - 75) {
                // move off right
                UIView.animate(withDuration: 0.3) {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                }
                return
            }
            
            UIView.animate(withDuration: 0.2) {
                card.center = self.view.center
                self.thumb.alpha = 0
            }
        }
    }
    
}
