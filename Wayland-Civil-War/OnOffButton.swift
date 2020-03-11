//
//  OnOffButton.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 12/30/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit

class OnOffButton: UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(UIColor.white, for: .normal)
        addTarget(self, action: #selector(OnOffButton.buttonPressed), for: .touchUpInside)
        activateButton(bool: !isOn)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? UIColor.green : UIColor.red
        let title = bool ? "ON" : "OFF"
        let titleColor = bool ? UIColor.white : UIColor.white
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
    

}
