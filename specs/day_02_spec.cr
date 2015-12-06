require "spec"
require "../src/day_02"

# Given a line separated list of lxwxh dimensions
# How many total square feet of wrapping paper is needed?

describe "Day_02" do
    describe "surface_area" do
        day_02 = Day_02.new
        surface_area = day_02.calculate_surface_area "2x3x4"
        surface_area.should eq [+12, +24, +16]
        surface_area.sum(+0).should eq +52
    end
end