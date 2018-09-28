import Foundation

struct VigenereCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        //maybe use guard????
        var encoded:String = ""
        if plaintext.range(of: "[^a-zA-Z]", options: .regularExpression) != nil || plaintext == "" {
            //encoded = "Input MUST be Alphabetic."
            return nil
        }
        if secret.range(of: "[^a-zA-Z]", options: .regularExpression) != nil || secret == "" {
            //encoded = "Key MUST be Alphabetic."
            return nil
        }
        
        var key:String = ""
        var cnt = 0
        for _ in 0..<plaintext.count{
            if cnt == secret.count{
                cnt = 0
            }
            key.append(secret[secret.index(secret.startIndex, offsetBy: cnt)])
            cnt += 1
        }
        
        let plaintextUP = plaintext.uppercased()
        let keyUP = key.uppercased()
        
        for i in 0..<plaintextUP.count {
            let p = plaintextUP[plaintextUP.index(plaintextUP.startIndex, offsetBy: i)]
            let k = keyUP[keyUP.index(keyUP.startIndex, offsetBy: i)]
            
            let pi = p.unicodeScalars.first!.value - Unicode.Scalar("A")!.value
            let ki = k.unicodeScalars.first!.value - Unicode.Scalar("A")!.value
            
            let pki = (pi + ki)%26 + Unicode.Scalar("A")!.value
            encoded = encoded + String(UnicodeScalar(UInt8(pki)))
        }
        
        return encoded
    }
    
    func decode(_ encodedtext:String, secret: String) -> String? {
        //maybe use guard????
        var decoded:String = ""
        if encodedtext.range(of: "[^a-zA-Z]", options: .regularExpression) != nil && encodedtext != "" {
            decoded = "Input MUST be Alphabetic."
            return decoded
        }
        if secret.range(of: "[^a-zA-Z]", options: .regularExpression) != nil && secret != "" {
            return nil
        }
        var key:String = ""
        var cnt = 0
        for _ in 0..<encodedtext.count{
            if cnt == secret.count{
                cnt = 0
            }
            key.append(secret[secret.index(secret.startIndex, offsetBy: cnt)])
            cnt += 1
        }
        
        let encodedtextUP = encodedtext.uppercased()
        let keyUP = key.uppercased()
        
        for i in 0..<encodedtextUP.count {
            let p = encodedtextUP[encodedtextUP.index(encodedtextUP.startIndex, offsetBy: i)]
            let k = keyUP[keyUP.index(keyUP.startIndex, offsetBy: i)]
            
            let pi = Int(p.unicodeScalars.first!.value - Unicode.Scalar("A")!.value)
            let ki = Int(k.unicodeScalars.first!.value - Unicode.Scalar("A")!.value)
            
            let pki = (pi - ki + 26)%26 + Int(Unicode.Scalar("A")!.value)
            decoded = decoded + String(UnicodeScalar(UInt8(pki)))
        }
        
        return decoded
    }
}
