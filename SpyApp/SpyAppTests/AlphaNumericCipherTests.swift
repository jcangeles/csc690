import XCTest
@testable import SpyApp

class AlphaNumericCaesarCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = AlphaNumericCaesarCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual("A", result)
    }
    
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        XCTAssertNil(result)
    }
    
    func test_negativeInputForSecret() {
        let result = cipher.encode("BCD", secret: "-1")
        XCTAssertNil(result)
    }
    
    func test_numericInputforPlainText(){
        let plaintext = "1"
        let result = cipher.encode(plaintext, secret: "1")
        XCTAssertEqual("2", result)
    }
    
    func test_nonAlphaNumericInputforPlainText(){
        let plaintext = "?"
        let result = cipher.encode(plaintext, secret: "1")
        XCTAssertEqual(result, "Input not AlphaNumeric.")
    }
    
}
