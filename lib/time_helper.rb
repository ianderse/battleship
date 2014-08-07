module TimeHelper
  def print_time_minutes(start, finish)
    finish.strftime("%M").to_i - start.strftime("%M").to_i
  end

  def print_time_seconds(start, finish)
    #fix if finsh time seconds are great than start time seconds
    printed_time = finish.strftime("%S").to_i - start.strftime("%S").to_i
    if printed_time < 0
      printed_time *= -1
    else
      printed_time
    end
  end
end
