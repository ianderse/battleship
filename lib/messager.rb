class Messager

  attr_reader :output, :input

  def initialize(input, output)
    @input = input
    @output = output
  end

  def repeat_shot
    output.puts "Coordinate has already been shot at, shoot again"
  end

  def miss
    output.puts "Miss!"
  end

  def ai_miss
    output.puts "Computer Misses!"
  end

  def hit
    output.puts "Hit!"
  end

  def ai_hit
    output.puts "Computer Hit!"
  end

  def sunk_ship(ship)
    output.puts "You sunk your opponents size #{ship.length} ship!"
    output.puts "press enter to continue"
    gets
  end

  def sunk_player_ship(ship)
    output.puts "Computer sunk your size #{ship.length} ship!"
    output.puts "press enter to continue"
    gets
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
    #need to fix this to display map correctly spaced with nil values
    output.puts "Your turn! Here's what you know:\n===========\n"
    output.puts ". 1 2 3 4"
    output.print "A"
    board.values.to_a[0..3].each {|pos| @output.print " " + pos.to_s}
    output.print "\nB"
    board.values.to_a[4..7].each {|pos| @output.print " " + pos.to_s}
    output.print "\nC"
    board.values.to_a[8..11].each {|pos| @output.print " " + pos.to_s}
    output.print "\nD"
    board.values.to_a[12..15].each {|pos| @output.print " " + pos.to_s}
    output.print "\n===========\nEnter a coordinate to shoot at:"
  end

  def print_ai_map(board)
    #need to fix this to display map correctly spaced with nil values
    #refactor with above
    output.puts "My turn! Here's what your map:\n===========\n"
    output.puts ". 1 2 3 4"
    output.print "A"
    board.values.to_a[0..3].each {|pos| @output.print " " + pos.to_s}
    output.print "\nB"
    board.values.to_a[4..7].each {|pos| @output.print " " + pos.to_s}
    output.print "\nC"
    board.values.to_a[8..11].each {|pos| @output.print " " + pos.to_s}
    output.print "\nD"
    board.values.to_a[12..15].each {|pos| @output.print " " + pos.to_s}
    output.puts ""
  end

  def win(shots=0, time=0)
    output.puts "Congratulations, you win!"
    output.puts "It took you #{shots} shots to sink your opponents ships."
    output.puts "You won in #{time}."
  end

  def lose(shots=0, time=0)
    output.puts "You lose!"
    output.puts "It took your opponent #{shots} shots to sink your ships."
    output.puts "You lost in #{time}."
  end

end
