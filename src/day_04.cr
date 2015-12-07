require "crypto/md5"

module Day_04
    class AdventCoin
        getter iteration, secret, zeroes

        def initialize(@secret = "" : String, @zeroes = +5 : Number)
            @iteration = +0
        end

        def is_valid(hash : String) : Bool
            if hash.size < @zeroes || hash[+0..@zeroes-+1] != "0"*@zeroes
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