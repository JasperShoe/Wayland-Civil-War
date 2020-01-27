//
//  CustomButton.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 12/25/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit

class CustomButton : UIButton{
     override init(frame: CGRect) {
            super.init(frame:frame)
            setupButton()
            
        }
        
        
        required init?(coder UIapplicationDelegate: NSCoder) {
            super.init(coder: UIapplicationDelegate)
            setupButton()
        }
        
        func setupButton() {
            setShadow()
            setTitleColor(.white, for: .normal)
            backgroundColor      = UIColor.red
                
            titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 15)
            layer.cornerRadius   = 25
            layer.borderWidth    = 3.0
            layer.borderColor    = UIColor.darkGray.cgColor
        }
        
        private func setShadow(){
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
            layer.shadowRadius = 8
            layer.shadowOpacity = 0.5
            clipsToBounds = true
            layer.masksToBounds = false
        }
        
        func shake() {
            let shake           = CABasicAnimation(keyPath: "position")
            shake.duration      = 0.1
            shake.repeatCount   = 2
            shake.autoreverses  = true
            
            let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
            let fromValue       = NSValue(cgPoint: fromPoint)
            
            let toPoint         = CGPoint(x: center.x + 8, y: center.y)
            let toValue         = NSValue(cgPoint: toPoint)
            
            shake.fromValue     = fromValue
            shake.toValue       = toValue
            
            layer.add(shake, forKey: "position")
        }
    

    }

