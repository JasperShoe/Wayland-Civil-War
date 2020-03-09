//
//  CardViewViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 1/22/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit

class CardViewViewController: UIViewController {

    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var rarity: UILabel!
    @IBOutlet weak var troopType: UILabel!
    @IBOutlet weak var bestFor: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.tintColor = .red
        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
        
    }
    
    var mytitle = String()
    var myrarity = String()
    var mytrooptype = String()
    var mybest = String()
    var mydescription = String()
    override func viewWillAppear(_ animated: Bool) {
        self.cardTitle?.text = mytitle
        self.rarity.text = myrarity
        self.troopType.text = mytrooptype
        self.bestFor.text = mybest
        self.cardDescription.text = mydescription
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        cardDescription.sizeToFit()
    }
    
}
