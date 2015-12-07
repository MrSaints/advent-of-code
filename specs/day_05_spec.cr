require "spec"
require "../src/day_05"

# Given a string containing random alphabets
# Determine if it's a "nice" string:
# 1. Contains 3 vowels ("aeiou"), e.g. xazegov
# 2. Contains 1 letter that appears twice in a row
# 3. Does not contain ab, cd, pq, or xy

describe "Day_05" do
    describe "NaughtyOrNice" do
        describe "initialize" do
        end

        describe "has_vowels" do # 1
            it "should contain at least +1 vowels" do
                non = Day_05::NaughtyOrNice.new
                non.has_vowels("azxc", +1).should be_true
                non.has_vowels("cvmnmlo", +1).should be_true
                non.has_vowels("qwrtpdfghajkcvbn", +1).should be_true
            end

            it "should contain at least +3 vowels" do
                non = Day_05::NaughtyOrNice.new
                non.has_vowels("aei", +3).should be_true
                non.has_vowels("xazegov", +3).should be_true
                non.has_vowels("aeiouaeiouaeiou", +3).should be_true
            end
        end

        describe "has_consecutive_letter" do # 2
            it "should contain no consecutive letters" do
                non = Day_05::NaughtyOrNice.new
                non.has_consecutive_letter("xy", +2).should be_false
                non.has_consecutive_letter("abcde", +2).should be_false
                non.has_consecutive_letter("abacbcded", +2).should be_false
            end

            it "should contain at least 1 letter that appears +2 times in a row" do
                non = Day_05::NaughtyOrNice.new
                non.has_consecutive_letter("xx", +2).should be_true
                non.has_consecutive_letter("abcdde", +2).should be_true
                non.has_consecutive_letter("aabbccdd", +2).should be_true
            end

            it "should contain at least 1 letter that appears +3 times in a row" do
                non = Day_05::NaughtyOrNice.new
                non.has_consecutive_letter("xxx", +3).should be_true
                non.has_consecutive_letter("abcddeee", +3).should be_true
                non.has_consecutive_letter("aabbbccdd", +3).should be_true
            end
        end

        describe "does_not_match" do # 3
            it "should not contain ab, cd, pq, or xy" do
                non = Day_05::NaughtyOrNice.new
                non.does_not_match("acpx", ["ab", "cd", "pq", "xy"]).should be_true
            end
        end

        describe "is_nice" do
        end
    end
end