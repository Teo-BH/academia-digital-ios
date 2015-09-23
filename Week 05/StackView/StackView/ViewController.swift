//
//  ViewController.swift
//  StackView
//
//  Created by Teobaldo Mauro de Moura on 9/23/15.
//  Copyright © 2015 Teobaldo Mauro de Moura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goatStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addGoat(sender: UIButton) {
        let image:UIImage = UIImage(named: "goat-512")!
        let view:UIImageView = UIImageView(image: image);
        goatStackView.addArrangedSubview(view)
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.goatStackView.layoutIfNeeded()
        }
    }
    
    @IBAction func removeGoat(sender: UIButton) {
        if (goatStackView.arrangedSubviews.count > 0) {
            let view:UIView = goatStackView.arrangedSubviews.last!
            goatStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.goatStackView.layoutIfNeeded()
        }
    }
}

