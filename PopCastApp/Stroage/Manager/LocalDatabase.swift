//
//  LocalDatabase.swift
//  PopCastApp
//
//  Created by hamid on 06.02.25.
//

import Foundation
import RealmSwift

protocol LocalDatabaseProtocol{
    func add<T: Object >(model:T)
    func clearAll<T: Object>(model: T.Type)
    func items<T: Object>()  ->[T]
    func delete <T: Object>(model: T)
    func deleteFromId<T: Object>(model: T.Type, id: String)
    
    func listenChange<T:Object>(model: T.Type, result:@escaping (LocalDatabaseUpdate, [Int])->Void)
}


enum LocalDatabaseUpdate{
    case delete
    case modify
    case insert
}
