//
//  Profile2ViewController.swift
//  Wayland-Civil-War
//
//  Created by Alex_Kashian on 1/16/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var userNameTag: UILabel!
    @IBOutlet weak var camera: UIButton!
    
<<<<<<< HEAD
    @IBOutlet weak var cancelButton: UIButton!
=======
<<<<<<< HEAD
    @IBOutlet weak var cancelButton: UIButton!
=======
     var ref:DatabaseReference?
>>>>>>> master
>>>>>>> 54c38beb35f65354f04713d3deb82f8b7deaf820
    
   @IBAction func importImage(_ sender: Any) {
       let image = UIImagePickerController()
       image.delegate = self
       
       image.sourceType = UIImagePickerController.SourceType.photoLibrary
       
       image.allowsEditing = false
       
       self.present(image, animated: true){}
    
   }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
               profileImage.image = image
                if let user = Auth.auth().currentUser {
                    
                }
            
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
<<<<<<< HEAD
        
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.tintColor = .red
        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
       
=======
        
<<<<<<< HEAD
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.tintColor = .red
        cancelButton.layer.cornerRadius = 10
        cancelButton.clipsToBounds = true
       
=======
        ref = Database.database().reference()
        
        if let curUser = Auth.auth().currentUser?.uid {
            print("fruity, ID: \(curUser)")
            _ = ref?.child("Users").child(curUser).child("Username").observeSingleEvent(of: .value, with: { (snapshot) in
                let userName = snapshot.value as? String
                self.userNameTag.text = userName
            })
        }
    }
    
    
    
    
    @IBAction func btnSignOut(_ sender: Any) {
    
        do
        {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
>>>>>>> master
>>>>>>> 54c38beb35f65354f04713d3deb82f8b7deaf820
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
