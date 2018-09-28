import Foundation

struct AlphaNumericCaesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        // Checks if input is A/N with REGEX
        if plaintext.range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil && plaintext != "" {
            encoded = "Input not AlphaNumeric."
            return encoded
        }
        
        for character in plaintext.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            //let shiftedUnicode = unicode + shiftBy
            var shiftedUnicode = unicode
            for _ in 0..<shiftBy{
                if shiftedUnicode == Unicode.Scalar("Z")?.value {
                    shiftedUnicode = Unicode.Scalar("0").value
                } else if shiftedUnicode == Unicode.Scalar("9")?.value {
                    shiftedUnicode = Unicode.Scalar("A").value
                } else{
                    shiftedUnicode += 1
                }
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ encodedtext:String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""

        // Checks if input is A/N with REGEX
        if encodedtext.range(of: "[^a-zA-Z0-9]", options: .regularExpression) != nil && encodedtext != "" {
            decoded = "Input not AlphaNumeric."
            return decoded
        }
        
        for character in encodedtext {
            let unicode = character.unicodeScalars.first!.value
            //let shiftedUnicode = unicode - shiftBy
            var shiftedUnicode = unicode
            for _ in 0..<shiftBy{
                if shiftedUnicode == Unicode.Scalar("Z")?.value {
                    shiftedUnicode = Unicode.Scalar("0").value
                } else if shiftedUnicode == Unicode.Scalar("9")?.value {
                    shiftedUnicode = Unicode.Scalar("A").value
                } else{
                    shiftedUnicode -= 1
                }
            }

            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
    
}
