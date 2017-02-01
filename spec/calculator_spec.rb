require_relative 'spec_helper'
require_relative '../lib/calculator.rb'

describe Calculator do

  before(:example) do
    @calculator = Calculator.new(10)
  end

  describe 'Initialization' do
    it 'is an instance of the Calculator class' do
      expect(@calculator).to be_instance_of(Calculator)
    end

    it 'should get current result' do
      expect(@calculator.result).to eq(10)
    end

    it "should be read-only" do
      expect{@calculator.result = 4}.to raise_error(NoMethodError)
    end
  end

  describe 'Methods' do
    it 'should reset calculator' do
      @calculator.reset(10)
      expect(@calculator.result).to eq(10)
    end

    it "should add" do
      @calculator.add(5)
      expect(@calculator.result).to eq(15)
    end

    it "should subtract" do
      @calculator.subtract(5)
      expect(@calculator.result).to eq(5)
    end

    it "should multiply" do
      @calculator.multiply(10)
      expect(@calculator.result).to eq(100)
    end

    it "should divide" do
      @calculator.divide(2)
      expect(@calculator.result).to eq(5)
    end

    it "ensure all methods are chainable" do
      @calculator.multiply(2).add(5)
      expect(@calculator.result).to eq(25)
    end

    it "should apply operation with the value of x" do
      @calculator.operation('add', 1000)
      expect(@calculator.result).to eq(1010)
    end

    it "cannot redo because no undo" do
      @calculator.redo()
      expect(@calculator.result).to eq(10)
    end

     it "should undo one operation restoring the result of the previous operation" do
       @calculator.add(10).undo()
       expect(@calculator.result).to eq(10)
     end

     it "should redo previously undone operation" do
       @calculator.add(10).undo()
       @calculator.redo()
       expect(@calculator.result).to eq(20)
     end
  end
end
