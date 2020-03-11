//
//  SignInScreen.swift
//  Wayland-Civil-War
//
//  Created by Artur_Poole on 2/4/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn
import FirebaseAuth
import FirebaseDatabase

class SignInScreen: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var btnSubmitUsername: UIButton!
    
    @IBOutlet weak var currentid: UILabel!
    
    var ref:DatabaseReference?
    var userID: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignIn.addTarget(self, action: #selector(signInUserUsingGoogle(_:)), for: .touchUpInside)
        
        ref = Database.database().reference()
        
        if let checkIn = Auth.auth().currentUser {
            currentid.text = checkIn.uid
            btnSignIn.setTitle("Sign Out", for: .normal)
        } else {
            currentid.text = "Not logged in"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      // [START auth_listener]
      let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        // [START_EXCLUDE]
        self.currentid.text = user?.email
        
        if let id = user?.uid {
            self.userID = id
            _ = self.ref?.child("Users").child(id).child("Username").observeSingleEvent(of: .value, with: { (snapshot) in
                let userName = snapshot.value as? String
                if userName != nil {
                    self.btnPlay.isHidden = false
                } else {
                    self.usernameField.isHidden = false
                    self.btnSubmitUsername.isHidden = false
                }
            })
        } else {
            self.btnPlay.isHidden = true
        }
        
        // [END_EXCLUDE]
      }
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @objc func signInUserUsingGoogle(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        if btnSignIn.title(for: .normal) == "Sign Out" {
            GIDSignIn.sharedInstance()?.signOut()
            
            
            lblTitle.text = ""
            btnSignIn.setTitle("Sign in using Google", for: .normal )
            btnPlay.isHidden = false
            
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
            currentid.text = "signed out"
            print("there should not be a nu \(Auth.auth().currentUser?.uid)")
            
            
        } else {
            GIDSignIn.sharedInstance()?.delegate = self
            GIDSignIn.sharedInstance()?.signIn()
        }
    
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print("We have error sign in user == \(error.localizedDescription)")
        } else if let gmailUser = user {
            print("kinky")
            lblTitle.text = "You are signed in using \(String(describing: gmailUser.profile.email))"
            btnSignIn.setTitle("Sign Out", for: .normal)
            
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                              accessToken: authentication.accessToken)
            
            
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print("kinky error: \(error)")
                    return
                }
                self.userID = Auth.auth().currentUser?.uid
            
            }
            
            
            
//            _ = ref?.child("Users").child(userID!).child("Username").observeSingleEvent(of: .value, with: { (snapshot) in
//                let userName = snapshot.value as? String
//
//                if userName != nil {
//                    self.btnPlay.isHidden = false
//                } else {
//                    print("username is \(userName)")
//                    self.usernameField.isHidden = false
//                    self.btnSubmitUsername.isHidden = false
//                }
//            })
            
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    @IBAction func submitUsername(_ sender: Any) {
        if let text = usernameField.text {
            ref?.child("Users").child(userID!).updateChildValues(["Username" : text, "Email" : Auth.auth().currentUser?.email])
            
            btnPlay.isHidden = false
            
        }
        
    }
    
}
