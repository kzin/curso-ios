//
//  Service.swift
//  ListaTelefonica
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import Alamofire
import Gloss

class Service: NSObject {
    
    static let sharedInstance = Service()
    
    func getLocais(completion: (result: [Local]) -> Void) {
        Alamofire.request(.GET, "http://www.fctradecenter.com/delivery/api/company", parameters: nil)
            .responseJSON { response in
                switch response.result {
                    
                case .Success(let json):
                    let response = Response(json : json as! JSON)
                    completion(result: (response?.locais)!)
                    
                case .Failure( _):
                    print("Failed to get data")
                }
        }
    }
}
