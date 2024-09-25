# LLM generated code
# used ChatGPT o1-preview
# thought for 21 seconds

def get_user_numbers
    puts "Welcome to the Eurojackpot Simulator!"
    user_main_numbers = []
    user_additional_numbers = []
  
    puts "Please enter your 5 unique main numbers (between 1 and 50):"
    while user_main_numbers.size < 5
      print "Enter main number #{user_main_numbers.size + 1}: "
      input = gets.chomp
      number = input.to_i
      if number.between?(1, 50) && !user_main_numbers.include?(number)
        user_main_numbers << number
      else
        puts "Invalid input. Please enter a unique number between 1 and 50."
      end
    end
  
    puts "Please enter your 2 unique additional numbers (between 1 and 10):"
    while user_additional_numbers.size < 2
      print "Enter additional number #{user_additional_numbers.size + 1}: "
      input = gets.chomp
      number = input.to_i
      if number.between?(1, 10) && !user_additional_numbers.include?(number)
        user_additional_numbers << number
      else
        puts "Invalid input. Please enter a unique number between 1 and 10."
      end
    end
  
    [user_main_numbers.sort, user_additional_numbers.sort]
  end
  
  def draw_numbers
    main_numbers = (1..50).to_a.sample(5).sort
    additional_numbers = (1..10).to_a.sample(2).sort
    [main_numbers, additional_numbers]
  end
  
  def combinations_match?(user_numbers, drawn_numbers)
    user_main, user_additional = user_numbers
    drawn_main, drawn_additional = drawn_numbers
    user_main == drawn_main && user_additional == drawn_additional
  end
  
  def simulate_draws(user_numbers)
    draws = 0
  
    loop do
      draws += 1
      drawn_numbers = draw_numbers
      puts "Draw #{draws}: Main numbers: #{drawn_numbers[0].join(', ')}, Additional numbers: #{drawn_numbers[1].join(', ')}"
      if combinations_match?(user_numbers, drawn_numbers)
        break
      end
    end
  
    draws
  end
  
  def calculate_years(draws)
    draws_per_year = 104 # 2 draws per week * 52 weeks
    years = draws.to_f / draws_per_year
    years
  end
  
  def main
    user_numbers = get_user_numbers
    total_draws = simulate_draws(user_numbers)
    years = calculate_years(total_draws)
    puts "Congratulations! Your combination has been drawn as the jackpot!"
    puts "Total number of draws: #{total_draws}"
    puts "It took approximately #{years.round(2)} years to hit the jackpot."
  end
  
  main
  