//
//  File.swift
//  PopCastApp
//
//  Created by hamid on 04.02.25.
//
import Alamofire
import Foundation


final class NetworkManeger{
    private let config : NetworkConfig
    
    init(config: NetworkConfig) {
        self.config = config
    }
   

    func send<T: Decodable>(
        path: NetworkPathProtocol,
        // TODD: NetworkMethod global
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? = nil,
        paramater: Parameters? = nil
        
    ) -> Result<T?,Error>{
        let url = config.baseUrl + path.value
        
        let reqeust: DataRequest
        
        if let body = body {
            reqeust = Af.request(url.)
        }
        
        
        return .success(nil)
    }
    
    
    
}
