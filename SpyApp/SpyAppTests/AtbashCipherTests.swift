import XCTest
@testable import SpyApp

class AtbashCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AtbashCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual(plaintext, result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        XCTAssertNil(result)
    }
    
    func test_negativeInputForSecret() {
        let result = cipher.encode("BCD", secret: "-1")
        XCTAssertNil(result)
    }
    
}
