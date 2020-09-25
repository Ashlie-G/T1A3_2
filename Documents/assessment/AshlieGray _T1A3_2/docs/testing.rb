require_relative '../main.rb'
describe 'smallest' do
    it 'should print welcome menu with 3 choices' do
    expect(smallest([2, 1])). to eq(1)
    end
    it 'should return the smallest number in a large array' do
    expect(smallest([2, 34, 32, 33, 55])). to eq(2)
    end
    it 'should return the smallest string in an array' do
    expect(smallest(["a", "abc"])). to eq("a")
    end
end