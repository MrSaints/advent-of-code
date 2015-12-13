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
    end

    struct Instructions
        getter operations

        def initialize(s = "" : String)
            @operations = [] of Hash(Symbol, String | Int32)
            s.each_line do |op|
                @operations << parse op
            end
        end

        def parse(s : String) : Hash(Symbol, String | Int32)
            re = /(\D+)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/
            s.match re, do |match|
                _, operation, x1, y1, x2, y2 = match
                return {
                    operation: operation,
                    x1: x1.to_i,
                    y1: y1.to_i,
                    x2: x2.to_i,
                    y2: y2.to_i
                }
            end
            { operation: "invalid", x1: +0, y1: +0, x2: +0, y2: +0 }
        end
    end
end