class Day_02
    def calculate_surface_area(lwh : String)
        l, w, h = lwh.split('x').map { |d| d.to_i }
        [2 * l * w, 2 * w * h, 2 * h * l]
    end

    def smallest_side(surface_area : Array)
        surface_area.min / 2
    end
end