//
//  SearchTrainInteractorTests.swift
//  MyTravelHelperTests
//
//  Created by siva krishna on 08/01/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import XCTest
@testable import MyTravelHelper

class SearchTrainInteractorTests: XCTestCase {
    var interactor = SearchTrainInteractorMock()
    var presenter: InteractorToPresenterProtocol?
    var _sourceStationCode = String()
    var _destinationStationCode = String()
    
    override func setUpWithError() throws {
       presenter = SearchTrainPresenterMock()
    }
    
    
    func testFetchTrainsFromSource() {
        _sourceStationCode = ""
        _destinationStationCode = ""
    }
    
    func testNoTrainAvailableFromSource() {
        interactor.fetchTrainsFromSource(sourceCode: _sourceStationCode, destinationCode: _destinationStationCode)
        
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testPerformanceExample() throws {
        // This is an examapple of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


class SearchTrainPresenterMock: InteractorToPresenterProtocol {
    func stationListFetched(list: [Station]) {
        
    }
    
    func fetchedTrainsList(trainsList: [StationTrain]?) {
        
    }
    
    func showNoTrainAvailbilityFromSource() {
        
    }
    
    func showNoInterNetAvailabilityMessage() {
        
    }
    
    
}
