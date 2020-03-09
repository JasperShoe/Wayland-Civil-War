//
//  InventoryViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 2/3/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.tintColor = .red
        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstSegue" {

            if let destinationVC = segue.destination as? CardViewViewController {
                destinationVC.mytitle = "Militia"
                destinationVC.myrarity = "Common"
                destinationVC.mytrooptype = "Light Infantry"
                destinationVC.mybest = "Defensive base holding"
                destinationVC.mydescription = "Irregular Militia Units - townsmen who grabbed home rifles to fight. Unexperinced but needed for the fight"
                
            }
        }
        else if segue.identifier == "secondSegue" {

            if let destinationVC = segue.destination as? CardViewViewController {
                destinationVC.mytitle = "Soldier"
                destinationVC.myrarity = "Uncommon"
                destinationVC.mytrooptype = "Medium Infantry"
                destinationVC.mybest = "Defensive base holding"
                destinationVC.mydescription = "Professional Soldier - well trained and armed. More dexterity then militia unit"
            }
        }
        
        else if segue.identifier == "thirdSegue" {

            if let destinationVC = segue.destination as? CardViewViewController {
                destinationVC.mytitle = "Marine"
                destinationVC.myrarity = "Rare"
                destinationVC.mytrooptype = "Heavy Infantry"
                destinationVC.mybest = "Defense and Attack"
                destinationVC.mydescription = "Marines - the best trained and equipped special forces soldiers. Most Versatile Infantry"
                   }
               }

        else if segue.identifier == "fourthSegue" {
            if let destinationVC = segue.destination as? CardViewViewController {
            destinationVC.mytitle = "Jeep"
            destinationVC.myrarity = "Uncommon"
            destinationVC.mytrooptype = "Light Artillery"
            destinationVC.mybest = "Defense and Attack"
            destinationVC.mydescription = "Light jeep armed with mounted machine gun. Great for attacking and deffending when it comes to artillery"
               }
        }
        
        else if segue.identifier == "fifthSegue" {
            if let destinationVC = segue.destination as? CardViewViewController {
            destinationVC.mytitle = "Tank"
            destinationVC.myrarity = "Rare"
            destinationVC.mytrooptype = "Medium Artillery"
            destinationVC.mybest = "Defense and Attack"
            destinationVC.mydescription = "Basic tank but is more then what meets the eye. found effictive if used correcly in either attack of defense"
               }
            
        }
        
        else if segue.identifier == "sixthSegue" {
            if let destinationVC = segue.destination as? CardViewViewController {
            destinationVC.mytitle = "Hover Tank"
            destinationVC.myrarity = "Epic"
            destinationVC.mytrooptype = "Heavy Artillery"
            destinationVC.mybest = "Defense and Attack"
            destinationVC.mydescription = "Heavy tank equipped with double the armor and double the fire power. Out classes other artillery with its size and power"
               }
            
        }
        
        else if segue.identifier == "seventhSegue" {
            if let destinationVC = segue.destination as? CardViewViewController {
            destinationVC.mytitle = "Drone"
            destinationVC.myrarity = "Rare"
            destinationVC.mytrooptype = "Light Aviation"
            destinationVC.mybest = "Attack"
            destinationVC.mydescription = "Small portable drone armed with dual mounted machine guns. quick and dangerous offensive troop that shouldnt be overlooked"
               }
        }
        
        else if segue.identifier == "eighthSegue" {
            if let destinationVC = segue.destination as? CardViewViewController {
            destinationVC.mytitle = "Gunship"
            destinationVC.myrarity = "Epic"
            destinationVC.mytrooptype = "Medium Aviation"
            destinationVC.mybest = "Attack"
            destinationVC.mydescription = "Large power ship armed with a collection of heavy weapons. Threatening piece of aviation with its fearful looks and capability"
               }
        }
        
        else if segue.identifier == "ninthSegue" {
            if let destinationVC = segue.destination as? CardViewViewController {
            destinationVC.mytitle = "Mothership"
            destinationVC.myrarity = "Legendary"
            destinationVC.mytrooptype = "Heavy Aviation"
            destinationVC.mybest = "Attack"
            destinationVC.mydescription = "Humongous gunship containing a massive amount of weaponry and armor. Known as the queen of the skies for all its accolades."
               }
            
        }
    }

    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
