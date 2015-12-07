module Day_05
    class NaughtyOrNice
        @vowels = ['a', 'e', 'i', 'o', 'u'] as Array(Char)

        def initialize
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

        
    end
end