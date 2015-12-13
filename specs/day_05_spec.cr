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
            it "should enumerate a line-separated list of naughty, and nice strings" do
                non = Day_05::NaughtyOrNice.new "abcdef\nghijkl"
                non.strings.should eq ["abcdef\n", "ghijkl"]
            end
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
            it "should contain xy" do
                non = Day_05::NaughtyOrNice.new
                non.does_not_match("xyzklab", ["xy"]).should be_false
            end

            it "should not contain ab, cd, pq, or xy" do
                non = Day_05::NaughtyOrNice.new
                non.does_not_match("acpx", ["ab", "cd", "pq", "xy"]).should be_true
            end
        end

        describe "create_letter_pairs" do
            it "should return an array (size n - 1) of letter pairs from a string" do
                non = Day_05::NaughtyOrNice.new
                non.create_letter_pairs("qwe").should eq ["qw", "we"]
                non.create_letter_pairs("abcdefg").should eq ["ab", "bc", "cd", "de", "ef", "fg"]
            end
        end

        describe "has_matching_pair" do
            it "should contain +2 or more matching pairs of letters" do
                non = Day_05::NaughtyOrNice.new
                non.has_matching_pair("aabcdefgaa").should be_true
                non.has_matching_pair("uurcxstgmygtbstg").should be_true
            end

            it "should contain no matching pairs of letters" do
                non = Day_05::NaughtyOrNice.new
                non.has_matching_pair("aaab").should be_false
                non.has_matching_pair("ieodomkazucvgmuy").should be_false
            end
        end

        describe "is_nice" do
            it "should be nice" do
                nice = Day_05::NaughtyOrNice.new
                nice.is_nice("ugknbfddgicrmopn").should be_true

                nice_2 = Day_05::NaughtyOrNice.new
                nice_2.is_nice("aaa").should be_true
            end

            it "should be naughty" do
                naughty = Day_05::NaughtyOrNice.new
                naughty.is_nice("jchzalrnumimnmhp").should be_false

                naughty_2 = Day_05::NaughtyOrNice.new
                naughty_2.is_nice("haegwjzuvuyypxyu").should be_false

                naughty_2 = Day_05::NaughtyOrNice.new
                naughty_2.is_nice("dvszwmarrgswjxmb").should be_false
            end
        end

        describe "total_nice" do
            it "should have +2 out of +4 nice strings" do
                mock = "ugknbfddgicrmopn\naaa\nhaegwjzuvuyypxyu\ndvszwmarrgswjxmb"
                non = Day_05::NaughtyOrNice.new mock
                non.total_nice.should eq +2
            end
        end
    end

    describe "answers" do
        it "part 01 should be +255" do
            strings = File.read("./data/day_05.txt")
            non = Day_05::NaughtyOrNice.new strings
            non.total_nice.should eq +255
        end
    end
end