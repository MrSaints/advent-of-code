# TODO: Refactor (add presents to class? per present methods?)
class Day_02
    def calculate_surface_area(lwh : String) : Array
        l, w, h = lwh.split('x').map { |d| d.to_i }
        [2 * l * w, 2 * w * h, 2 * h * l]
    end

    def smallest_side(surface_area : Array) : Number
        surface_area.min / 2
    end

    def paper_needed(lwh : String) : Number
        surface_area = calculate_surface_area lwh
        extra_paper = smallest_side surface_area
        total = surface_area.sum(+0) + extra_paper
        total
    end

    def process(presents : String) : Number
        total = 0
        presents.each_line do |present|
          total += paper_needed present
        end
        total
    end
end