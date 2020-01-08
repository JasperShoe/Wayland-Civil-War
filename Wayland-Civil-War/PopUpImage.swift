//
//  PopUpImage.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 12/30/19.
//  Copyright © 2019 HACS. All rights reserved.
//

import UIKit

class PopUpImage: UIImageView{

    @IBOutlet weak var popUpImageView: UIImageView!
    
    
    @IBAction func RedPushed(_ sender: Any) {
        let image : UIImage = UIImage(named: "FlagRed")!
        popUpImageView = UIImageView(image: image)

    }
    
}
