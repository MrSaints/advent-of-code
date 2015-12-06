require "spec"
require "../src/day_03"

# Given a set of directions ^v>< (NSEW respectively)
# How many UNIQUE houses does Santa visits?

describe "Day_03" do
    describe "GPS" do
        describe "initialize" do
            it "should set the starting coordinates to +0, +1" do
                gps = Day_03::GPS.new +0, +1
                gps.x.should eq +0
                gps.y.should eq +1
            end
        end

        describe "move_north" do
            it "should move the current coordinates North to give +1, +0" do
                gps = Day_03::GPS.new +0, +0
                gps.move_north
                gps.x.should eq +1
            end
        end

        describe "move_south" do
            it "should move the current coordinates South to give -1, +0" do
                gps = Day_03::GPS.new +0, +0
                gps.move_south
                gps.x.should eq -1
            end
        end

        describe "move_west" do
            it "should move the current coordinates West to give +0, -1" do
                gps = Day_03::GPS.new +0, +0
                gps.move_west
                gps.y.should eq -1
            end
        end

        describe "move_east" do
            it "should move the current coordinates East to give +0, +1" do
                gps = Day_03::GPS.new +0, +0
                gps.move_east
                gps.y.should eq +1
            end
        end

        describe "snapshot" do
            it "should record the current coordinates to a history array" do
                gps = Day_03::GPS.new +0, +0
                gps.snapshot
                gps.history.should eq [[+0, +0]]
                gps.move_south
                gps.move_east
                gps.snapshot
                gps.history.should eq [[+0, +0], [-1, +1]]
            end
        end

        describe "unique_coordinates" do
            it "should return a unique array of coordinates from the history (deduplicated)" do
                gps = Day_03::GPS.new +0, +0
                gps.snapshot
                gps.move_south
                gps.snapshot
                gps.move_north
                gps.snapshot
                gps.move_east
                gps.snapshot
                gps.move_west
                gps.snapshot
                gps.unique_coordinates.should eq [[+0, +0], [-1, +0], [+0, +1]]
            end
        end
    end

    describe "Santa" do
        describe "initialize" do
            it "should enumerate a string of instructions" do
                santa = Day_03::Santa.new "^v^v^v^v^v"
                santa.instructions.should eq ['^','v','^','v','^','v','^','v','^','v']
            end
        end

        describe "deliver" do
            it "should deliver presents to +2 houses" do
                santa = Day_03::Santa.new ">"
                santa.deliver
                santa.delivered.should eq +2
            end
        end
    end
end
