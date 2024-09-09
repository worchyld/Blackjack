//
//  BettingTests.swift
//  BlackjackTests
//
//  Created by Amarjit on 09/09/2024.
//

import XCTest
@testable import Blackjack

class BettingManagerTests: XCTestCase {
    var bettingManager: BettingManager!
    
    override func setUp() {
        super.setUp()
        bettingManager = BettingManager(initialCoins: 100)
    }
    
    func testInitialState() {
        XCTAssertEqual(bettingManager.coins, 100)
        XCTAssertEqual(bettingManager.currentBet, 0)
    }
    
    func testAddToBet() {
        XCTAssertNoThrow(try bettingManager.addToBet(50))
        XCTAssertEqual(bettingManager.currentBet, 50)
        XCTAssertEqual(bettingManager.coins, 50)
    }
    
    func testAddToBetInsufficientFunds() {
        XCTAssertThrowsError(try bettingManager.addToBet(150)) { error in
            XCTAssertEqual(error as? BettingManager.BettingError, .insufficientFunds)
        }
    }
    
    func testAddToBetInvalidAmount() {
        XCTAssertThrowsError(try bettingManager.addToBet(-10)) { error in
            XCTAssertEqual(error as? BettingManager.BettingError, .invalidBet)
        }
    }
    
    func testCancelBet() {
        XCTAssertNoThrow(try bettingManager.addToBet(50))
        bettingManager.cancelBet()
        XCTAssertEqual(bettingManager.currentBet, 0)
        XCTAssertEqual(bettingManager.coins, 100)
    }
    
    func testSubmitBet() {
        XCTAssertNoThrow(try bettingManager.addToBet(50))
        let submittedBet = bettingManager.submitBet()
        XCTAssertEqual(submittedBet, 50)
        XCTAssertEqual(bettingManager.currentBet, 0)
        XCTAssertEqual(bettingManager.coins, 50)
    }
    
    func testCanBet() {
        XCTAssertTrue(bettingManager.canBet(50))
        XCTAssertTrue(bettingManager.canBet(100))
        XCTAssertFalse(bettingManager.canBet(101))
        XCTAssertFalse(bettingManager.canBet(0))
        XCTAssertFalse(bettingManager.canBet(-10))
    }
    
    func testCanBetAfterPartialBet() {
        XCTAssertNoThrow(try bettingManager.addToBet(30))
        XCTAssertTrue(bettingManager.canBet(50))
        XCTAssertTrue(bettingManager.canBet(70))
        XCTAssertFalse(bettingManager.canBet(71))
    }
    
    func testChipAvailability() {
        let chips = [5, 10, 20, 50]
        
        // Initially, all chips should be available
        for chip in chips {
            XCTAssertTrue(bettingManager.canBet(chip))
        }
        
        // After betting 80, only 5, 10, and 20 should be available
        XCTAssertNoThrow(try bettingManager.addToBet(80))
        XCTAssertTrue(bettingManager.canBet(5))
        XCTAssertTrue(bettingManager.canBet(10))
        XCTAssertTrue(bettingManager.canBet(20))
        XCTAssertFalse(bettingManager.canBet(50))
        
        // After betting 15 more, only 5 should be available
        XCTAssertNoThrow(try bettingManager.addToBet(15))
        XCTAssertTrue(bettingManager.canBet(5))
        XCTAssertFalse(bettingManager.canBet(10))
        XCTAssertFalse(bettingManager.canBet(20))
        XCTAssertFalse(bettingManager.canBet(50))
    }
    
    func testSubmitButtonAvailability() {
        // Initially, submit should be disabled
        XCTAssertFalse(bettingManager.currentBet > 0)
        
        // After placing a bet, submit should be enabled
        XCTAssertNoThrow(try bettingManager.addToBet(10))
        XCTAssertTrue(bettingManager.currentBet > 0)
        
        // After submitting, it should be disabled again
        _ = bettingManager.submitBet()
        XCTAssertFalse(bettingManager.currentBet > 0)
    }
}
