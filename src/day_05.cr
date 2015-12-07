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

        def is_nice(s : String) : Bool
            if has_vowels(s) && has_consecutive_letter(s) && does_not_match(s)
                return true
            end
            false
        end

        def total_nice : Number
            @strings.sum do |s|
                if is_nice(s)
                    +1
                else
                    +0
                end
            end
        end
    end
end