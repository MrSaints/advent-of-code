class Day_01
    property floor
    getter basement

    def initialize(@floor = 0 : Number)
    end

    def up
        @floor += 1
    end

    def down
        @floor -= 1
    end

    def entered_basement(index : Number)
        @basement ||= index + 1
    end

    def process(instructions : String)
        index = 0
        while index < instructions.size
            if instructions[index] == '('
                up
            else
                down
            end

            if @floor == -1
                entered_basement index
            end

            index += 1
        end
    end
end
