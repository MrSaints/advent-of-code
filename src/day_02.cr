class Day_02
    def calculate_surface_area(lwh : String)
        l, w, h = lwh.split('x').map { |d| d.to_i }
        [2 * l * w, 2 * w * h, 2 * h * l]
    end
end