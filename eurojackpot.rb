def enter_values(lowerLimit, upperLimit, count)
    array = Array.new
    until array.length == count
        puts "Enter a number between #{lowerLimit} and #{upperLimit} (including both limits)"
        number = gets
        number = Integer(number, exception: false)
        if number == nil
            puts "You need to enter a number!"
            next
        end
        if number < lowerLimit or number > upperLimit
            puts "Number is not within limits!"
            next
        end
        if array.include?(number)
            puts "You can't enter a same number twice"
            next
        end
        array.push(number)
    end
    array
end

def generate_random_unique_array(lowerLimit, upperLimit, count)
    array = Array.new
    until array.length == count
        number = rand(lowerLimit..upperLimit)
        if array.include?(number)
            next
        end
        array.push(number)
    end
    array
end

def draw_eurojackpot
    mainNumbers = Array.new
    bonusNumbers = Array.new
    mainNumbers = generate_random_unique_array(1, 50, 5)
    bonusNumbers = generate_random_unique_array(1, 10, 2)
    draw = [mainNumbers, bonusNumbers]
    draw
end

def compare_ticket?(ticket, draw)
    ticket[0].sort == draw[0].sort and ticket[1].sort == draw[1].sort
end

def print_collection(collection)
    puts collection[0].join(',') + " - " + collection[1].join(',')
end

puts "EUROJACKPOT"
puts "First enter 5 main numbers"
mainNumbers = enter_values(1, 50, 5)
puts "Now enter 2 bonus numbers"
bonusNumbers = enter_values(1, 10, 2)
eurojackpotTicket = [mainNumbers, bonusNumbers]
puts "Your ticket is:"
print_collection(eurojackpotTicket)

drawsElapsed = 0
loop do
    currentDraw = draw_eurojackpot
    print_collection(currentDraw)
    if compare_ticket?(eurojackpotTicket, currentDraw)
        puts "MATCH"
        puts "Your ticket was:"
        print_collection(eurojackpotTicket)
        break
    end
    drawsElapsed = drawsElapsed + 1
end

weeks = drawsElapsed / 2
years = weeks / 52
puts "It took #{years} years to hit the eurojackpot"