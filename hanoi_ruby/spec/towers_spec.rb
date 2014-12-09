require "towers"

describe "TowersOfHanoi" do
  
  subject(:towers) { TowersOfHanoi.new }
  
  it "should initialize with 3 disks on first pegs" do
    expect(towers.pegs).to eq([[3, 2, 1], [], []])
  end
  
  it "displays the towers" do
    expect{towers.render}.to output("*** ** * \n\n\n").to_stdout
  end
  
  it "should allow you to move disks between pegs" do
    towers.move(0, 1)
    expect(towers.pegs).to eq([[3, 2], [1], []])
  end
  
  it "should not allow you to place a larger disk on top of a smaller disk" do
    towers.move(0, 1)
    expect{ towers.move(0, 1) }.to raise_error
  end
  
  it "should end game if all disks are on 2nd or 3rd peg" do
    towers.instance_variable_set(:@pegs, [[], [3, 2, 1], []]) 
    expect(towers.win?).to be true
  end
  
  it "should get user input and make move" do
    allow(towers).to receive(:gets).and_return("0, 1")
    towers.get_move
    expect(towers.pegs).to eq([[3, 2], [1], []])
  end
  
end
