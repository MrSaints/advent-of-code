module Day_02
    struct Santa_GPS
        getter x, y

        def initialize(@x : Number, @y : Number)
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
    end
end