require "spec"
require "../src/day_06"

# Given a set of coordinates, and instructions
# How many lights are lit?

describe "Day_06" do
    describe "Lights" do
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

    describe "Instructions" do
        describe "initialize" do
            it "should parse a line-separated list of instructions into a hash map" do
                mock = "turn off 427,423 through 929,502\nturn on 774,14 through 977,877"
                expected = [
                    { operation: "turn off", x1: +427, y1: +423, x2: +929 , y2: +502 },
                    { operation: "turn on", x1: +774, y1: +14, x2: +977 , y2: +877 }
                ]
                instructions = Day_06::Instructions.new mock
                instructions.operations.should eq expected
            end
        end

        describe "parse" do
            it "should parse a string 'turn on' instruction into a hash map" do
                instructions = Day_06::Instructions.new
                expected = { operation: "turn on", x1: +489, y1: +959, x2: +759 , y2: +964 }
                instructions.parse("turn on 489,959 through 759,964").should eq expected
            end

            it "should parse a string 'turn off' instruction into a hash map" do
                instructions = Day_06::Instructions.new
                expected = { operation: "turn off", x1: +619, y1: +46, x2: +931 , y2: +342 }
                instructions.parse("turn off 619,46 through 931,342").should eq expected
            end

            it "should parse a string 'toggle' instruction into a hash map" do
                instructions = Day_06::Instructions.new
                expected = { operation: "toggle", x1: +549, y1: +969, x2: +612 , y2: +991 }
                instructions.parse("toggle 549,969 through 612,991").should eq expected
            end

            it "should not parse an invalid string instruction" do
                instructions = Day_06::Instructions.new
                expected = { operation: "invalid", x1: +0, y1: +0, x2: +0 , y2: +0 }
                instructions.parse("toggle 549,969 612,991").should eq expected
            end
        end
    end
end