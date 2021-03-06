module Day_03
    struct GPS
        getter x, y, history

        def initialize(@x : Number, @y : Number)
            @history = [] of Array(Int32 | Int32)
        end

        def move_north
            @x += +1
        end

        def move_south
            @x -= +1
        end

        def move_west
            @y -= +1
        end

        def move_east
            @y += +1
        end

        def snapshot
            @history << [@x, @y]
        end

        def unique_coordinates : Array(Array(Int32 | Int32))
            @history.uniq
        end
    end

    class Santa
        getter instructions, gps

        def initialize(instructions : String, ignore = +0 : Number)
            @instructions = instructions.chars
            if ignore != +0
                index = +0
                @instructions = @instructions.select do |i|
                    index += +1
                    if ignore == +1
                        index % +2 == +1
                    else
                        index % ignore == +0
                    end
                end
            end

            @gps = GPS.new +0, +0
        end

        def deliver
            index = +0
            @gps.snapshot
            while index < @instructions.size
                case instructions[index]
                when '^'
                    @gps.move_north
                when 'v'
                    @gps.move_south
                when '<'
                    @gps.move_west
                when '>'
                    @gps.move_east
                end
                @gps.snapshot
                index += +1
            end
        end

        def houses : Number
            @gps.unique_coordinates.size
        end
    end
end