//
//  NetworkPath.swift
//  PopCastApp
//
//  Created by hamid on 04.02.25.
//

import Foundation

enum NetworkPath: String, NetworkPathProtocol{
    case login = "/login"
    
    var value: String {
        self.rawValue
    }
}
protocol NetworkPathProtocol {
    var value : String { get }
}
