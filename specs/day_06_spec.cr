require "spec"
require "../src/day_06"

# Given a set of coordinates, and instructions
# How many lights are lit?

describe "Day_06" do
    describe "Switch" do
        describe "initialize" do
            it "should create a x: +2 by y: +3 grid containing false" do
                lights = Day_06::Switch.new +2, +3
                lights.grid.should eq [[false, false, false], [false, false, false]]
            end

            it "should create a x: +2 by y: +2 grid containing false" do
                lights = Day_06::Switch.new +2, +2
                lights.grid.should eq [[false, false], [false, false]]
            end
        end

        describe "switch_on" do
            it "should switch on the light on +1, +1" do
                lights = Day_06::Switch.new +3, +2
                lights.switch_on +1, +1
                lights.grid.should eq [[false, false], [false, true], [false, false]]
            end
        end

        describe "switch_off" do
            it "should switch off the light on +1, +0" do
                lights = Day_06::Switch.new +3, +2, true
                lights.switch_off +1, +0
                lights.grid.should eq [[true, true], [false, true], [true, true]]
            end
        end

        describe "toggle" do
            it "should toggle the light on +0, +1" do
                lights = Day_06::Switch.new +3, +2
                lights.toggle +0, +1
                lights.grid.should eq [[false, true], [false, false], [false, false]]
                lights.toggle +0, +1
                lights.grid.should eq [[false, false], [false, false], [false, false]]
            end
        end

        describe "total_on" do
            it "should correctly return the total number of lights turned on" do
                lights = Day_06::Switch.new
                lights.grid = [[true, false], [false, true], [false, false]]
                lights.total_on.should eq +2

                lights.grid = [[false, false], [true, true], [false, false]]
                lights.total_on.should eq +2

                lights.grid = [[true, false], [true, true], [false, true]]
                lights.total_on.should eq +4
            end
        end
    end

    describe "Brightness" do
        describe "initialize" do
            it "should create a x: +2 by y: +3 grid containing lights with +0 brightness" do
                brightness = Day_06::Brightness.new +2, +3
                brightness.grid.should eq [[+0, +0, +0], [+0, +0, +0]]
            end
        end

        describe "switch_on" do
            it "should increase the brightness on +1, +1 by +1" do
                brightness = Day_06::Brightness.new +3, +2
                brightness.switch_on +1, +1
                brightness.grid.should eq [[+0, +0], [+0, +1], [+0, +0]]
            end
        end

        describe "switch_off" do
            it "should decrease the brightness on +1, +0 by -1" do
                brightness = Day_06::Brightness.new +3, +2, +1
                brightness.switch_off +1, +0
                brightness.grid.should eq [[+1, +1], [+0, +1], [+1, +1]]
            end

            it "should not decrease the brightness on +1, +0" do
                brightness = Day_06::Brightness.new +3, +2
                brightness.switch_off +1, +0
                brightness.grid.should eq [[+0, +0], [+0, +0], [+0, +0]]
            end
        end

        describe "toggle" do
            it "should increase the brightness on +0, +1 by +2" do
                brightness = Day_06::Brightness.new +3, +2
                brightness.toggle +0, +1
                brightness.grid.should eq [[+0, +2], [+0, +0], [+0, +0]]
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

        describe "run_operation" do
            it "should correctly run a single +3x+3 light operation" do
                instructions = Day_06::Instructions.new
                mock = {
                    operation: "turn on",
                    x1: +0,
                    y1: +0,
                    x2: +2,
                    y2: +2,
                }
                instructions.run_operation mock
                instructions.lights.total_on.should eq +9
            end

            it "should correctly run a single +1000x+1000 light operation" do
                instructions = Day_06::Instructions.new
                mock = {
                    operation: "turn on",
                    x1: +0,
                    y1: +0,
                    x2: +999,
                    y2: +999,
                }
                instructions.run_operation mock
                instructions.lights.total_on.should eq +1000000
            end
        end

        describe "run_all" do
            it "should run a single parsed / instantiated operation" do
                mock = "toggle 0,0 through 1,1"
                instructions = Day_06::Instructions.new mock
                instructions.run_all
                instructions.lights.total_on.should eq +4
            end

            it "should run multiple parsed / instantiated operations" do
                mock = "toggle 0,0 through 1,1\ntoggle 0,0 through 1,1"
                instructions = Day_06::Instructions.new mock
                instructions.run_all
                instructions.lights.total_on.should eq +0
            end
        end
    end

    describe "answers" do
        it "part 01 should be +569999" do
            operations = File.read("./data/day_06.txt")
            instructions = Day_06::Instructions.new operations
            instructions.run_all
            instructions.lights.total_on.should eq +569999
        end

        it "part 02 should be +17836115" do
            operations = File.read("./data/day_06.txt")
            type = Day_06::Brightness.new(+1000, +1000)
            instructions = Day_06::Instructions.new operations, type
            instructions.run_all
            instructions.lights.total_on.should eq +17836115
        end
    end
end