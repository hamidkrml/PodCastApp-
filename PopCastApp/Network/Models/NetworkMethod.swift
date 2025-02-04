//
//  NetworkMethod.swift
//  PopCastApp
//
//  Created by hamid on 04.02.25.
//

import Foundation
import Alamofire

enum NetworkMethod{
    case GET
    case POST
    case PUT
    
    var aloamofireMethod: HTTPMethod{
        switch self {
        case .GET:
            return .get
        case .POST:
            return .post
        case .PUT:
            return .put
        }
    }
}
