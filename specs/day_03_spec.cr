require "spec"
require "../src/day_03"

# Given a set of directions ^v>< (NSEW respectively)
# How many UNIQUE houses does Santa visits?

describe "Day_02" do
    describe "Santa_GPS" do
        describe "initialize" do
            it "should set the starting coordinates to +0, +1" do
                gps = Day_02::Santa_GPS.new +0, +1
                gps.x.should eq +0
                gps.y.should eq +1
            end
        end

        describe "move_north" do
            it "should move the current coordinates North to give +1, +0" do
                gps = Day_02::Santa_GPS.new +0, +0
                gps.move_north
                gps.x.should eq +1
            end
        end

        describe "move_south" do
            it "should move the current coordinates South to give -1, +0" do
                gps = Day_02::Santa_GPS.new +0, +0
                gps.move_south
                gps.x.should eq -1
            end
        end

        describe "move_west" do
            it "should move the current coordinates West to give +0, -1" do
                gps = Day_02::Santa_GPS.new +0, +0
                gps.move_west
                gps.y.should eq -1
            end
        end

        describe "move_east" do
            it "should move the current coordinates East to give +0, +1" do
                gps = Day_02::Santa_GPS.new +0, +0
                gps.move_east
                gps.y.should eq +1
            end
        end
    end
end
