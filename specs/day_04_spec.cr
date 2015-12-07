require "spec"
require "../src/day_04"

# Given a secret key
# Find the lowest number that combines with it (key + number)
# to produce an MD5 hash that starts with 5 zeros (00000...).

describe "Day_04" do
    describe "AdventCoin" do
        describe "initialize" do
            it "should set the secret to abcdef" do
                ac = Day_04::AdventCoin.new "abcdef"
                ac.secret.should eq "abcdef"
            end

            it "should set the number of zeroes required to +6" do
                ac = Day_04::AdventCoin.new "", +6
                ac.zeroes.should eq +6
            end
        end

        describe "is_valid" do
            it "should return false for a hash of aa7c9c12fc740955ef4dfad670250ff4" do
                ac = Day_04::AdventCoin.new
                ac.is_valid("aa7c9c12fc740955ef4dfad670250ff4").should be_false
            end

            it "should return false for a hash of 000011dbbfa3a5c83a2d506429c7b00e" do
                ac = Day_04::AdventCoin.new
                ac.is_valid("000011dbbfa3a5c83a2d506429c7b00e").should be_false
            end

            it "should return true for a hash of 000001dbbfa3a5c83a2d506429c7b00e" do
                ac = Day_04::AdventCoin.new
                ac.is_valid("000001dbbfa3a5c83a2d506429c7b00e").should be_true
            end
        end

        describe "is_valid with 6 zeroes" do
            it "should return false for a hash of aa7c9c12fc740955ef4dfad670250ff4" do
                ac = Day_04::AdventCoin.new
                ac.is_valid("aa7c9c12fc740955ef4dfad670250ff4").should be_false
            end

            it "should return false for a hash of 000001dbbfa3a5c83a2d506429c7b00e" do
                ac = Day_04::AdventCoin.new "", +6
                ac.is_valid("000001dbbfa3a5c83a2d506429c7b00e").should be_false
            end

            it "should return true for a hash of 000000dbbfa3a5c83a2d506429c7b00e" do
                ac = Day_04::AdventCoin.new "", +6
                ac.is_valid("000000dbbfa3a5c83a2d506429c7b00e").should be_true
            end
        end

        describe "generate" do
            it "should generate a hash of 5f8b62a2dced0cd28946a9c891ff3e5e" do
                ac = Day_04::AdventCoin.new "abcdef"
                ac.generate(+1).should eq "5f8b62a2dced0cd28946a9c891ff3e5e"
            end
        end

        describe "mine" do
            it "should return a hash of 000001dbbfa3a5c83a2d506429c7b00e using a key of abcdef" do
                ac = Day_04::AdventCoin.new "abcdef"
                ac.mine.should eq "000001dbbfa3a5c83a2d506429c7b00e"
            end

            it "should return a hash of 000006136ef2ff3b291c85725f17325c using a key of pqrstuv" do
                ac = Day_04::AdventCoin.new "pqrstuv"
                ac.mine.should eq "000006136ef2ff3b291c85725f17325c"
            end
        end

        describe "iteration" do
            it "should return an iteration of +609043 to generate a valid AdventCoin using abcdef" do
                ac = Day_04::AdventCoin.new "abcdef"
                ac.mine
                ac.iteration.should eq +609043
            end

            it "should return an iteration of +1048970 to generate a valid AdventCoin using pqrstuv" do
                ac = Day_04::AdventCoin.new "pqrstuv"
                ac.mine
                ac.iteration.should eq +1048970
            end
        end
    end

    describe "answers" do
        it "part 01 should be +117946" do
            ac = ac = Day_04::AdventCoin.new "ckczppom"
            ac.mine
            ac.iteration.should eq +117946
        end

        it "part 02 should be +3938038" do
            ac = ac = Day_04::AdventCoin.new "ckczppom", +6
            ac.mine
            ac.iteration.should eq +3938038
        end
    end
end