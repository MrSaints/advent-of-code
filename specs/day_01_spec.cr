require "spec"
require "../src/day_01"

# Given a set of up, and down binary instructions
# What floor should Santa be in?

describe "Day_01" do
    describe "initialize" do
        it "should set the floor to +1" do
            day_01 = Day_01.new +1
            day_01.floor.should eq +1
        end
    end

    describe "floor" do
        it "should change the floor to +2" do
            day_01 = Day_01.new +0
            day_01.floor.should eq +0
            day_01.floor = +2
            day_01.floor.should eq +2
        end
    end

    describe "up" do
        it "should go up +1 floor" do
            day_01 = Day_01.new +0
            day_01.up
            day_01.floor.should eq +1
        end
    end

    describe "down" do
        it "should go down -1 floor" do
            day_01 = Day_01.new +0
            day_01.down
            day_01.floor.should eq -1
        end
    end

    describe "process" do
        it "should be on floor +0" do
            day_01 = Day_01.new +0
            day_01.process "(())"
            day_01.floor.should eq +0

            day_01.process "()()"
            day_01.floor.should eq +0
        end

        it "should be on floor +3" do
            day_01 = Day_01.new +0
            day_01.process "((("
            day_01.floor.should eq +3

            day_01.floor = +0
            day_01.process "(()(()("
            day_01.floor.should eq +3

            day_01.floor = +0
            day_01.process "))((((("
            day_01.floor.should eq +3
        end

        it "should be on floor -1" do
            day_01 = Day_01.new +0
            day_01.process "())"
            day_01.floor.should eq -1

            day_01.floor = +0
            day_01.process "))("
            day_01.floor.should eq -1
        end

        it "should be on floor -3" do
            day_01 = Day_01.new +0
            day_01.process ")))"
            day_01.floor.should eq -3

            day_01.floor = +0
            day_01.process ")())())"
            day_01.floor.should eq -3
        end
    end

    describe "entered_basement" do
        it "should be immutable" do
            day_01 = Day_01.new +0
            day_01.entered_basement +2
            day_01.basement.should eq +3

            day_01.entered_basement +4
            day_01.basement.should eq +3
        end

        it "should be on position +1" do
            day_01 = Day_01.new +0
            day_01.process ")"
            day_01.basement.should eq +1
        end

        it "should be on position +5" do
            day_01 = Day_01.new +0
            day_01.process "()())"
            day_01.basement.should eq +5
        end
    end

    describe "answers" do
        it "part 01 should be +280" do
            instructions = File.read("./data/day_01.txt")
            day_01 = Day_01.new +0
            day_01.process instructions
            day_01.floor.should eq +280
        end

        it "part 02 should be +1797" do
            instructions = File.read("./data/day_01.txt")
            day_01 = Day_01.new +0
            day_01.process instructions
            day_01.basement.should eq +1797
        end
    end
end