module Day_03
    struct GPS
        getter x, y, history

        def initialize(@x : Number, @y : Number)
            @history = [] of Array(Int32 | Int32)
        end

        def move_north
            @x += 1
        end

        def move_south
            @x -= 1
        end

        def move_west
            @y -= 1
        end

        def move_east
            @y += 1
        end

        def snapshot
            @history << [@x, @y]
        end

        def unique_coordinates : Array(Array(Int32 | Int32))
            @history.uniq
        end
    end
end