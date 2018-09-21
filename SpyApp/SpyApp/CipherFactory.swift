import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Caesar": CaesarCipher(),
        "AlphaNumeric": AlphaNumericCaesarCipher(),
        "Vigenere": VigenereCipher(),
        "Atbash": AtbashCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
