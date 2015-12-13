module Day_06
    struct Lights
        property grid

        def initialize(@x = +1 : Number, @y = +1 : Number, @default = false : Bool)
            @grid = Array.new(@x) { Array.new(@y) { @default } }
        end

        # TODO: Error handling?
        def switch_on(x : Number, y : Number)
            @grid[x][y] = true
        end

        def switch_off(x : Number, y : Number)
            @grid[x][y] = false
        end

        def toggle(x : Number, y : Number)
            @grid[x][y] = !@grid[x][y]
        end

        def total_on
            @grid.sum do |x|
                x.sum do |y|
                    if y
                        +1
                    else
                        +0
                    end
                end
            end
        end

        # (\D+)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)
    end
end