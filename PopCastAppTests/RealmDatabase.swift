//
//  RealmDatabase.swift
//  PopCastAppTests
//
//  Created by hamid on 06.02.25.
//
import RealmSwift
import XCTest


@testable import PopCastApp

internal class TestObject :Object{
    @Persisted(primaryKey: true) var _id : ObjectId
    @Persisted var name: String = ""
    
    var idValue : String {
    return _id.stringValue
    }
    
}




final class RealmDatabaseTest: XCTestCase {
    
    var realmDatabase: RealmDatabase!
    
    override func setUp() {
        super.setUp()
        realmDatabase = RealmDatabase(
            inMemoryIdentifier: "TestableRealm",
            objects: [TestObject.self]
            
        )
        
    }
    func testAddItem(){
        let testObject = TestObject()
        testObject.name = "Test"
        realmDatabase.add(model: testObject)
        
        let items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Test")
    }
    func testdeleteItem(){
        let testObject = TestObject()
        testObject.name = "Test"
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Test")
        
        realmDatabase.delete(model: testObject)
        
        XCTAssertEqual(items.count, 0)
    }
    func testClearAll(){
        let testObject = TestObject()
        testObject.name = "Test"
        realmDatabase.add(model: testObject)
        var items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Test")
        realmDatabase.clearAll(model: TestObject.self)
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
        
    }
    func testDeleteFromId(){
        let testObject = TestObject()
        testObject.name = "Test"
        realmDatabase.add(model: testObject)
        var items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "Test")
        realmDatabase.deleteFromId(model: TestObject.self, id: testObject.idValue)
        items = realmDatabase.items<TestObject>() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }
}
