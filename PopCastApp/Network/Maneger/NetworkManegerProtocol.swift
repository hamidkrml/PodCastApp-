//
//  NetworkManegerProtocol.swift
//  PopCastApp
//
//  Created by hamid on 04.02.25.
//

import Foundation
import Alamofire

protocol NetworkManegerProtocol {
    
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? ,
        paramater: Parameters?
        
    ) async -> Result<T,Error>
}

extension NetworkManegerProtocol{
    
    func send<T: Decodable>(
        path: NetworkPathProtocol,
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? = nil,
        paramater: Parameters? = nil
        
    ) async -> Result<T,Error>{
        return await send(path: path, method: method, type: type, body: body, paramater: paramater)
    }
}
