class Messager

  attr_reader :output, :input

  def initialize(input, output)
    @input = input
    @output = output
  end

  def print_instructions
    output.puts "instructions"
  end

  def print_intro
    output.puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right."
  end

  def two_unit_ship
    output.print "Enter the squares for the two-unit ship: "
  end

  def three_unit_ship
    output.print "Enter the squares for the three-unit ship: "
  end

  def welcome
    output.puts "Welcome to BATTLESHIP\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def invalid
    output.puts "invalid ship placement"
  end

  def input
    input.gets.strip.downcase
  end

  def print_player_map(board)
    output.puts "Your turn! Here's what you know:\n===========\n"
    output.puts ". 1 2 3 4"
    output.printf "A"
    board.values.to_a[0..3].each {|pos| @output.printf " " + pos.to_s}
    output.printf "\nB"
    board.values.to_a[4..7].each {|pos| @output.printf " " + pos.to_s}
    output.printf "\nC"
    board.values.to_a[8..11].each {|pos| @output.printf " " + pos.to_s}
    output.printf "\nD"
    board.values.to_a[12..15].each {|pos| @output.printf " " + pos.to_s}
    output.puts "\n===========\nEnter a coordinate to shoot at:"
  end

  def print_ai_map(board)

  end

end
