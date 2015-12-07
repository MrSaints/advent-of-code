module Day_05
    class NaughtyOrNice
        @vowels = ['a', 'e', 'i', 'o', 'u'] as Array(Char)

        def initialize
        end

        def has_vowels(s : String, requirement = 3 : Number) : Bool
            total = s.count { |c| @vowels.includes?(c) }
            if total >= requirement
                return true
            end
            false
        end
    end
end