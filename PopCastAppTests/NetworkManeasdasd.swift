
    //
    //  PopCastAppTests1.swift
    //  PopCastAppTests1
    //
    //  Created by hamid on 04.02.25.
    //
    import Foundation
    import XCTest

    @testable import PopCastApp
    final class PopCastAppTests1: XCTestCase {
        
        var networkManager: NetworkManeger!
        
        
        override func setUp() {
            networkManager = NetworkManeger(config: NetworkConfig(baseUrl: "https://openwhyd.org/"))
        }
        func testWithMusicResponse() async{
            let result = await networkManager.send(path: MockPath.music, method: .GET, type: [MusicElement].self)
            
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        struct MusicElement: Decodable {
            let uNm : String
            let name: String
            
        }
        
        enum MockPath: String, NetworkPathProtocol {
            case music = "adrien?format=json"
            
            var value: String {
                return rawValue
            }
        }
    }
