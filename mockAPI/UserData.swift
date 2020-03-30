//
//  UserData.swift
//  demoMockAPI
//
//  Created by Dhrubojyoti on 31/03/20.
//  Copyright © 2020 Dhrubojyoti. All rights reserved.
//

import Foundation

enum userResponse{
    case sucess
    case failer
}

struct userData:Equatable {
    
     var userName:String?
     var userEmail:String?
    
    init() {
        self.userEmail = nil
        self.userEmail = nil
    }
    
    init(userName:String,Email:String) {
        self.userEmail = Email
        self.userName = userName
    }
    
    func data(for response:userResponse) -> userData {
        if response == .sucess{
            let dummyName = "Name"
            let dummyEmail = "email@email.com"
            return userData(userName: dummyName, Email: dummyEmail)
        }else{
            return userData()
        }
    }
    
}
