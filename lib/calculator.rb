class Calculator
  attr_reader :result
  attr_accessor :history
  attr_accessor :undonehistory

  def initialize(result)
    @result = result
    @history
    @undonehistory
  end

  def result
    @result
  end

  def reset(x)
    @result = x
  end

  def add(x)
    @history = @result
    @result += x
    self
  end

  def subtract(x)
    @history = @result
    @result -= x
    self
  end

  def multiply(x)
    @history = @result
    @result *= x
    self
  end
  def divide(x)
    @history = @result
    @result /= x
    self
  end

  def operation(op, x)
    @history = @result
    case
      when op == "add"
        @result += x
      when op == "subtract"
        @result -= x
      when op == "multiply"
        @result *= x
      when op == "divide"
        @result /= x
    end
  end

  def undo
    @undonehistory = @result
    @result = @history
  end

  def redo
    if (@undonehistory == nil)
      @result = @result
    else
      @result = @undonehistory
      @undonehistory = nil
    end
  end
end
