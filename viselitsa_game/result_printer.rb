class ResultPrinter

  def print_status(game)
    cls
    puts "\nСлово: #{get_word_for_print(game.letters, game.correct_letters)}"

    puts "Ошибки: #{game.wrong_letters.join(", ")}"

    print_viselitsa(game.errors)

    if game.status == -1
      puts "\nВы проиграли\n"
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.status == 1
      puts "Вы выиграли!\n\n"
    else
      puts "Осталось ошибок: " + (7 - game.errors).to_s
    end
  end

  def get_word_for_print(letters, correct_letters)
    result = ""

    for item in letters do
      if correct_letters.include?(item)
        result += item + " "
      else
        result += "_ "
      end
    end

    return result
  end

  def print_viselitsa(errors)
    case errors
    when 0
      puts "
         _______
         |/
         |
         |
         |
         |
         |
         |
         |
       __|________
       |         |
       "
   when 1
     puts "
       _______
       |/
       |     ( )
       |
       |
       |
       |
       |
       |
     __|________
     |         |
     "
   when 2
     puts "
       _______
       |/
       |     ( )
       |      |
       |
       |
       |
       |
       |
     __|________
     |         |
     "
   when 3
     puts "
       _______
       |/
       |     ( )
       |      |_
       |        \\
       |
       |
       |
       |
     __|________
     |         |
     "
   when 4
     puts "
       _______
       |/
       |     ( )
       |     _|_
       |    /   \\
       |
       |
       |
       |
     __|________
     |         |
     "
   when 5
     puts "
       _______
       |/
       |     ( )
       |     _|_
       |    / | \\
       |      |
       |
       |
       |
     __|________
     |         |
     "

   when 6
     puts "
       _______
       |/
       |     ( )
       |     _|_
       |    / | \\
       |      |
       |     / \\
       |    /   \\
       |
     __|________
     |         |
     "
   when 7
     puts "
       _______
       |/     |
       |     (_)
       |     _|_
       |    / | \\
       |      |
       |     / \\
       |    /   \\
       |
     __|________
     |         |
     "
   end
 end

 def cls
   system("clear") || system("cls")
 end
end
