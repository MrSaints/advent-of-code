# This challenge can be accomplished using backreferences.
# Nevertheless, I'm against using it as it's not _real regexp_.
# Furthermore, there's no efficient implementation of it, and
# it's more challenging to implement a non-regexp solution.
#
# "Patterns with backreferences are not regular expressions,
# contrary to popular terminology. All regular expressions
# (in the actual definition of the word) describe patterns
# that can be matched in a single linear-time pass over the
# input text. This is what package regexp implements."
module Day_05
    class NaughtyOrNice
        getter strings

        @vowels = ['a', 'e', 'i', 'o', 'u'] as Array(Char)
        @ignore = ["ab", "cd", "pq", "xy"] as Array(String)

        def initialize(strings = "" : String)
            @strings = [] of String
            @strings = strings.lines
        end

        def has_vowels(s : String, requirement = +3 : Number) : Bool
            total = s.count { |c| @vowels.includes?(c) }
            if total >= requirement
                return true
            end
            false
        end

        # TODO: Refactor
        def has_consecutive_letter(s : String, requirement = +2 : Number) : Bool
            string_array = s.chars
            success = false
            matches = +0
            index = +0
            last_character = ' '

            while index < string_array.size && !success
                if last_character == string_array[index]
                    matches += +1
                end

                if (requirement - +1) == matches
                    success = true
                end

                last_character = string_array[index]
                index += +1
            end

            success
        end

        def does_not_match(s : String, ignore = @ignore : Array(String)) : Bool
            !(create_regexp(ignore) =~ s)
        end

        def create_regexp(ignore = [] of Array(String)) : Regex
            matches = ignore.join("|")
            Regex.new(matches, Regex::Options::IGNORE_CASE)
        end

        def create_letter_pairs(s : String)
            index = +0
            s_length = s.size
            pairs = [] of String
            while index < s_length - +1
                pair = s[index].to_s + s[index + +1].to_s

                if index != +0 && pairs[index - +1] == pair
                    pair = ""
                end

                pairs << pair
                index += +1
            end
            pairs
        end

        def has_matching_pair(s : String) : Bool
            pairs = create_letter_pairs s
            pairs.uniq.size < pairs.size
        end

        def has_letter_between(s : String) : Bool
            index = +0
            s_length = s.size
            while index < s_length - +2
                if s[index] == s[index + +2]
                    return true
                end
                index += +1
            end
            false
        end

        def is_nice(s : String) : Bool
            if has_vowels(s) && has_consecutive_letter(s) && does_not_match(s)
                return true
            end
            false
        end

        def is_nice_2(s : String) : Bool
            if has_matching_pair(s) && has_letter_between(s)
                return true
            end
            false
        end

        # TODO: Refactor (clean redundant code)
        def total_nice : Number
            @strings.sum do |s|
                if is_nice(s)
                    +1
                else
                    +0
                end
            end
        end

        def total_nice_2 : Number
            @strings.sum do |s|
                if is_nice_2(s)
                    +1
                else
                    +0
                end
            end
        end
    end
end