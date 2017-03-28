//
//  ViewController.swift
//  ZingMp3-Animation
//
//  Created by Quang Bach on 3/23/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbZing: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    var c: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        img.alpha = 0
        lbName.alpha = 0
        lbZing.alpha = 0
        c = self.lbZing.center
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 4, animations: { 
            self.img.alpha = 1
        }) { (success) in
            UIView.animate(withDuration: 4, animations: { 
                self.lbZing.center = CGPoint(x: self.img.center.x, y: self.lbName.center.y)
                self.lbZing.alpha = 1
            }, completion: { (success) in
                UIView.animate(withDuration: 4, animations: { 
                    self.lbName.center = CGPoint(x: self.img.center.x, y: self.c.y)
                    self.lbName.alpha = 1
                }, completion: { (success) in
                   self.performSegue(withIdentifier: "toLogin", sender: nil)
                })
                
            })
        }
        
        
    }


}

