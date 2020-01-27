//
//  Profile2ViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 1/16/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var camera: UIButton!
    
   @IBAction func importImage(_ sender: Any) {
       let image = UIImagePickerController()
       image.delegate = self
       
       image.sourceType = UIImagePickerController.SourceType.photoLibrary
       
       image.allowsEditing = false
       
       self.present(image, animated: true){
       }
   }
   
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
               profileImage.image = image
           }
       self.dismiss(animated: true, completion: nil)
   }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        self.profileImage.backgroundColor = UIColor.black
        
        camera.layer.borderWidth = 1
        camera.layer.masksToBounds = false
        camera.layer.borderColor = UIColor.black.cgColor
        camera.layer.cornerRadius = camera.frame.height/2
        camera.clipsToBounds = true
        self.camera.backgroundColor = UIColor.lightGray
       
        
    }
    
    
}
