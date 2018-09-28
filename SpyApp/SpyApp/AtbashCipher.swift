import Foundation

struct AtbashCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded:String = ""
        
        if plaintext.range(of: "[^a-zA-Z]", options: .regularExpression) != nil && plaintext != "" {
            encoded = "Input not Alphabetic."
            return encoded
        }
        
        let plaintextUP = plaintext.uppercased()
        
        for ch in plaintextUP{
            let ch_idx = Int(Unicode.Scalar("Z")!.value - (ch.unicodeScalars.first!.value - Unicode.Scalar("A")!.value))
            encoded = encoded + String(UnicodeScalar(UInt8(ch_idx)))
        }
        return encoded
    }
    
    func decode(_ encodedtext:String, secret: String) -> String? {

        var decoded:String = ""
        let encodedtextUP = encodedtext.uppercased()
        
        for ch in encodedtextUP{
            let ch_idx = Int(Unicode.Scalar("Z")!.value - (ch.unicodeScalars.first!.value - Unicode.Scalar("A")!.value))
            decoded = decoded + String(UnicodeScalar(UInt8(ch_idx)))
        }
        return decoded
    }
}
