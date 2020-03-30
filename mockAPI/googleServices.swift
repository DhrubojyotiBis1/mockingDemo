//
//  googleServices.swift
//  demoMockAPI
//
//  Created by Dhrubojyoti on 31/03/20.
//  Copyright © 2020 Dhrubojyoti. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol API {
    func googleSignIn(withUrl url: URL, completion: @escaping(userData?,Error?)->())
}

extension URLSession: API{
    func googleSignIn(withUrl url: URL, completion: @escaping (userData?, Error?) -> ()) {
        let task = dataTask(with: url) { (data, _, error) in
            if error == nil{
                do {
                    let userJson = try JSON(data: data!)
                    let userName = userJson["userName"].string!
                    let userEmail = userJson["userEmail"].string!
                    
                    completion(userData(userName: userName, Email: userEmail),nil)
                } catch {
                    print("error: ", error)
                }
            }
        }
        task.resume()
    }
}

final class MockAPI: API {
    func googleSignIn(withUrl url: URL, completion: @escaping (userData?, Error?) -> ()) {
        self.createDummyData { (data) in
            completion(data,nil)
        }
    }
    
    private func createDummyData(completion:@escaping(userData)->()){
        let dummyName = "Name"
        let dummyEmail = "email@email.com"
        completion(userData(userName: dummyName, Email: dummyEmail))
    }
}
