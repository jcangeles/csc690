//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by Juan Angeles on 11/1/18.
//  Copyright © 2018 Juan Angeles. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoTests: XCTestCase {

    var task: Task!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        task = Task("")
    }
    
    //Test if the title of a Task is an empty string
    //Works and instanciates a Task Object
    func test_emptyStringAsTitle(){
        let emptyString = ""
        XCTAssertEqual(emptyString, task.title)
    }
    
    //Test if creating of a Task with the 1-parameter constructor defaults the "done" attribute to false
    func test_initTaskHasFalseCheckMark(){
        XCTAssertEqual(false, task.done)
    }


}
