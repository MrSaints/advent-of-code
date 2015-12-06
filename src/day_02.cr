# TODO: Refactor (add presents to class? per present methods?)
struct Paper
    getter l, w, h

    def initialize(@l : Number, @w : Number, @h : Number)
    end

    def surface_area : Array(Int32)
        [+2 * @l * @w, +2 * @w * @h, +2 * @h * @l]
    end

    def smallest_side : Number
        surface_area.min / +2
    end

    def total : Number
        surface_area.sum + smallest_side
    end
end

class Day_02
    getter presents

    def initialize(presents : String)
        @presents = [] of Array(Int32 | Int32 | Int32)
        presents.each_line do |present|
            @presents << convert_to_array present
        end
    end

    def convert_to_array(lwh : String) : Array(Int32)
        lwh.split('x').map { |d| d.to_i }
    end

    def paper_needed : Number
        @presents.sum do |present|
            l, w, h = present
            paper = Paper.new l, w, h
            paper.total
        end
    end
end