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

        def total_on : Number
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
        getter operations, lights

        def initialize(s = "" : String)
            @lights = Lights.new +1000, +1000
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

        def run_operation(op : Hash(Symbol, String | Int32))
            index_x = op[:x1].to_i
            index_y = op[:y1].to_i
            end_x = op[:x2].to_i + +1
            end_y = op[:y2].to_i + +1
            operation = op[:operation]

            while index_x < end_x
                while index_y < end_y
                    case operation
                    when "turn on"
                        @lights.switch_on index_x, index_y
                    when "turn off"
                        @lights.switch_off index_x, index_y
                    when "toggle"
                        @lights.toggle index_x, index_y
                    end

                    index_y += +1
                end

                index_y = op[:y1].to_i
                index_x += +1
            end
        end

        def run_all
            @operations.each do |op|
                run_operation op
            end
        end
    end
end