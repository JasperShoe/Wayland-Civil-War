//
//  Constnts.swift
//  Wayland-Civil-War
//
//  Created by Artur_Poole on 2/4/20.
//  Copyright © 2020 HACS. All rights reserved.
//

import Foundation
import Firebase

struct Constants {
    struct refs {
        
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
    
    
    
}
