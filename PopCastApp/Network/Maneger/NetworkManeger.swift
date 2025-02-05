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
    private let decoder : JSONDecoder
    
    init(config: NetworkConfig, decoder: JSONDecoder = JSONDecoder()){
        self.config = config
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }
   

    func send<T: Decodable>(
        path: NetworkPathProtocol,
        
        
        
        // TODD: NetworkMethod global
        method: NetworkMethod,
        type: T.Type,
        body: Encodable? = nil,
        paramater: Parameters? = nil
        
    ) async -> Result<T,Error>{
        let url = config.baseUrl + path.value
        
        let reqeust: DataRequest
        
        if let body = body{
            reqeust = AF.request(url, method: method.alamofireMethod, parameters: body, encoder: JSONParameterEncoder.default)
        }else{
            reqeust = AF.request(url, method: method.alamofireMethod, parameters: paramater)
        }
        
        let response = await reqeust.validate()
            .serializingDecodable(T.self,decoder: decoder)
            .response
        guard let responseValue = response.value else{
            return .failure(response.error ?? NetworkError.unknown)
        }
        
        
        return .success(responseValue)
    }
    
    
    
}
