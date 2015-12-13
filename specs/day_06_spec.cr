require "spec"
require "../src/day_06"

# Given a set of coordinates, and instructions
# How many lights are lit?

describe "Day_06" do
    describe "initialize" do
        it "should create a x: +2 by y: +3 grid containing false" do
            lights = Day_06::Lights.new +2, +3
            lights.grid.should eq [[false, false, false], [false, false, false]]
        end

        it "should create a x: +2 by y: +2 grid containing false" do
            lights = Day_06::Lights.new +2, +2
            lights.grid.should eq [[false, false], [false, false]]
        end
    end

    describe "switch_on" do
        it "should switch on the light on +1, +1" do
            lights = Day_06::Lights.new +3, +2
            lights.switch_on +1, +1
            lights.grid.should eq [[false, false], [false, true], [false, false]]
        end
    end

    describe "switch_off" do
        it "should switch off the light on +1, +0" do
            lights = Day_06::Lights.new +3, +2, true
            lights.switch_off +1, +0
            lights.grid.should eq [[true, true], [false, true], [true, true]]
        end
    end

    describe "toggle" do
        it "should toggle the light on +0, +1" do
            lights = Day_06::Lights.new +3, +2
            lights.toggle +0, +1
            lights.grid.should eq [[false, true], [false, false], [false, false]]
            lights.toggle +0, +1
            lights.grid.should eq [[false, false], [false, false], [false, false]]
        end
    end

    describe "total_on" do
        it "should correctly return the total number of lights turned on" do
            lights = Day_06::Lights.new
            lights.grid = [[true, false], [false, true], [false, false]]
            lights.total_on.should eq +2

            lights.grid = [[false, false], [true, true], [false, false]]
            lights.total_on.should eq +2

            lights.grid = [[true, false], [true, true], [false, true]]
            lights.total_on.should eq +4
        end
    end
end