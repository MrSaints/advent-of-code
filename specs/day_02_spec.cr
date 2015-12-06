require "spec"
require "../src/day_02"

# Given a line separated list of lxwxh dimensions
# How many total square feet of wrapping paper is needed?

describe "Paper" do
    describe "initialize" do
        it "should set the length, width, and height to +1" do
            paper = Paper.new +1, +2, +3
            paper.l.should eq +1
            paper.w.should eq +2
            paper.h.should eq +3
        end
    end

    describe "surface_area" do
        it "should correctly calculate the surface area for 2x3x4" do
            paper = Paper.new +2, +3, +4
            surface_area = paper.surface_area
            surface_area.should eq [+12, +24, +16]
            surface_area.sum(+0).should eq +52
        end

        it "should correctly calculate the surface area for 1x1x10" do
            paper = Paper.new +1, +1, +10
            surface_area = paper.surface_area
            surface_area.should eq [+2, +20, +20]
            surface_area.sum(+0).should eq +42
        end
    end

    describe "smallest_side" do
        it "should correctly return the area of the smallest side for 2x3x4" do
            paper = Paper.new +2, +3, +4
            paper.smallest_side.should eq +6
        end

        it "should correctly return the area of the smallest side for 1x1x10" do
            paper = Paper.new +1, +1, +10
            paper.smallest_side.should eq +1
        end
    end

    describe "total" do
        it "should correctly return the total square feet of paper needed for 2x3x4" do
            paper = Paper.new +2, +3, +4
            paper.total.should eq +58
        end

        it "should correctly return the total square feet of paper needed for 1x1x10" do
            paper = Paper.new +1, +1, +43
        end
    end
end

describe "Day_02" do
    describe "initialize" do
        it "should normalize a single lxwxh present" do
            day_02 = Day_02.new "2x3x4"
            day_02.presents.should eq [[+2, +3, +4]]
        end

        it "should normalize a line separated list of lxwxh presents" do
            day_02 = Day_02.new "2x3x4\n1x1x10"
            day_02.presents.should eq [[+2, +3, +4], [+1, +1, +10]]
        end
    end

    describe "convert_to_array" do
        it "should convert a lxwxh string to an array" do
            day_02 = Day_02.new ""
            day_02.convert_to_array("2x3x4").should eq [+2, +3, +4]
        end
    end

    describe "paper_needed" do
        it "should return the total square feet of paper needed for all presents" do
            day_02 = Day_02.new "2x3x4\n1x1x10"
            day_02.paper_needed.should eq +101
        end
    end

    describe "answers" do
        it "part 01 should be +1606483" do
            presents = File.read("./data/day_02.txt")
            day_02 = Day_02.new presents
            day_02.paper_needed.should eq +1606483
        end
    end
end