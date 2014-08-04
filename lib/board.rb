require_relative 'messager'

class Board
  def initialize(input, output)
    @messager = Messager.new(input, output)
  end

  def setup
    @messager.print_intro
  end

  def get_choice
    @messager.input
  end

end
