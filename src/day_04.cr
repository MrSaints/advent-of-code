require "crypto/md5"

module Day_04
    class AdventCoin
        getter iteration

        def initialize(@secret = "" : String)
            @iteration = +0
        end

        def is_valid(hash : String) : Bool
            if hash.size < +5 || hash[+0..+4] != "00000"
                return false
            end
            true
        end

        def generate(i : Number) : String
            Crypto::MD5.hex_digest @secret + i.to_s
        end

        def mine : String
            hash = ""
            while !is_valid(hash) && @iteration < +100000000 # Safety
                @iteration += +1
                hash = generate @iteration
            end
            hash
        end
    end
end