//
//  Service.swift
//  EventosCatracaLivre
//
//  Created by Rodrigo Cavalcante on 9/22/16.
//  Copyright © 2016 Rodrigo Cavalcante. All rights reserved.
//

import Alamofire
import Gloss

class Service: NSObject {
    
    static let sharedInstance = Service()
    func getLocais(completion: (result: [Evento]) -> Void) {
        Alamofire.request(.GET, "https://api.catracalivre.com.br/select/?q=ibirapuera&wt=json", parameters: nil)
            .responseJSON { response in
                switch response.result {
                    
                case .Success(let json):
                    let response = Response(json : json as! JSON)
                    completion(result: (response?.docs?.eventos)!)
                    
                case .Failure(let error):
                    print("Failed to get data \(error)")
                }
        }
    }
}
