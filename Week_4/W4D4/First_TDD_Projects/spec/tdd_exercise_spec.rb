require 'rspec'
require 'tdd_exercise'

describe "#my_uniq" do
    it "returning a new array without duplicates" do
        arr = [1, 2, 1, 3, 3]
        expect(arr.my_uniq).to eq([1, 2, 3])
        expect(arr).to eq([1, 2, 1, 3, 3])
    end
end

describe "#two_sum" do 
    it " find all pairs of positions where the elements at those positions sum to zeroz" do 
        expect([-1, 0, 2, -2, 1].two_sum).to include([0,4],[2,3])
    end 

    it "is ordered from smaller index to bigger index" do 
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end 
end 

describe "#my_transpose" do 
    it "converts 2D array between the row-oriented and column-oriented representations " do 
        expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq ([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end 
end 

describe "stock_picker" do
    it "returns the most profitable index pair of days on which to first buy the stock and then sell the stock" do
        expect(stock_picker([3, -1, 2, 5, 1, 6])).to eq([1,5])
    end
end

describe Tower_of_Hanoi do 
    subject(:tower) {Tower_of_Hanoi.new(4)} 

    describe "#initialize" do 
        it "should set @towers to a 2D array with length of 3" do 
            expect(tower.towers.length).to eq(3)
        end 

        it "accept a size and assign it to @disks" do 
            expect(tower.disks).to eq(4)
        end 
    end 

    describe "#start_game" do
        it "fills first tower with disks" do
            expect(tower.towers[0]).to eq([1, 2, 3, 4])
        end
    end

    describe "#move_disk" do
        before (:each) {tower.move_disk(0,1)}
        it "raises an error if a given index is out of range" do
            expect{tower.move_disk(1,3)}.to raise_error("Tower indexes are out of range")
        end

        it "raises an error if the tower you are taking from is empty" do
            expect{tower.move_disk(2,1)}.to raise_error("Cannot move disk from empty tower")      
        end 

        it "raises an error if your trying to put a bigger disk on a smaller disk" do
            expect{tower.move_disk(0,1)}.to raise_error("Cannot move bigger disk on smaller disk")      
        end  

        it "move a disk to one tower to another" do
            tower.move_disk(0,2)
            expect(tower.towers).to eq([[3,4],[1],[2]])
        end  
    end

    # describe "#get_input" do
    #     # before(:each) {pos = tower.get_input}
    #     it "should call #gets to get input from the user" do 
    #         allow(tower.towers).to receive(:gets).and_return("0\n")
    #         expect(tower).to receive(:gets)
    #     end 
    #     it "should call string#chomp on the input receive by the user" do 
    #         num = "0\n" 
    #         allow(tower.towers).to receive(:gets).and_return(num)
    #         expect(num).to receive(:chomp) 
    #     end 

    #     it "should return the user input as an array" do 
    #         expect(pos.instance_of?(Array)).to be true
    #     end 
    # end 

    describe "#won?" do
        before(:each) do
            tower.towers[0], tower.towers[1] = tower.towers[1], tower.towers[0]
        end

        it "return true if all disks are moved to either tower[1] or tower[2]" do
            expect(tower.won?).to be true
        end
        
        it "return false if disks have not been moved to another single tower" do
            tower.move_disk(1, 2)
            expect(tower.won?).to be false
        end
    end

    # def "run"

    # end
    
end 