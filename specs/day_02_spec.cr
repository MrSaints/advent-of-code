require "spec"
require "../src/day_02"

# Given a line separated list of lxwxh dimensions
# How many total square feet of wrapping paper is needed?

describe "Day_02" do
    describe "surface_area" do
        it "should correctly calculate the surface area" do
            day_02 = Day_02.new
            surface_area = day_02.calculate_surface_area "2x3x4"
            surface_area.should eq [+12, +24, +16]
            surface_area.sum(+0).should eq +52

            surface_area_2 = day_02.calculate_surface_area "1x1x10"
            surface_area_2.should eq [+2, +20, +20]
            surface_area_2.sum(+0).should eq +42
        end
    end

    describe "smallest_side" do
        it "should return the value of the smallest side" do
            day_02 = Day_02.new
            surface_area = day_02.calculate_surface_area "2x3x4"
            smallest_side = day_02.smallest_side surface_area
            smallest_side.should eq 6

            surface_area_2 = day_02.calculate_surface_area "1x1x10"
            smallest_side_2 = day_02.smallest_side surface_area_2
            smallest_side_2.should eq 1
        end
    end
end