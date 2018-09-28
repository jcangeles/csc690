import XCTest
@testable import SpyApp

class VigenereCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = VigenereCipher()
    }
    
    func test_oneCharacterStirngGetsMappedToSelfWith_A_secret() {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "A")
        XCTAssertEqual(plaintext.uppercased(), result)
    }
    
    func test_nonAlphabetStringInputForSecret() {
        let result = cipher.encode("b", secret: "1")
        XCTAssertNil(result)
    }
    
    func test_negativeInputForSecret() {
        let result = cipher.encode("BCD", secret: "-1")
        XCTAssertNil(result)
    }
    
    func test_nullInputForSecret() {
        let result = cipher.encode("BCD", secret: "")
        XCTAssertNil(result)
    }
    
    func test_nullInputForText() {
        let result = cipher.encode("", secret: "B")
        XCTAssertNil(result)
    }
    
    func test_multipleCharForSecret() {
        let result = cipher.encode("", secret: "ABC")
        XCTAssertNil(result)
    }
    
}
