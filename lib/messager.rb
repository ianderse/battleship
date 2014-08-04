class Messager

  def initialize(input, output)
    @input = input
    @output = output
  end

  def print_instructions
    @output.puts "instructions"
  end

  def print_intro
    @output.puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\nEnter the squares for the two-unit ship:"
  end

  def menu_input
    @input.gets.chomp.downcase[0]
  end

  def input
    @input.gets.chomp.downcase
  end

end
