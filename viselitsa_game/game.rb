class Game

  def initialize(word)

    @letters = get_letters(word)
    @errors = 0

    @correct_letters = []
    @wrong_letters = []

    @status = 0
  end
  def get_letters(word)
    if word == nil || word == ""
      abort "Для игры введите слово в качестве аргумента " 
    end

    return word.encode("UTF-8").split("")
  end

  def status
    return @status
  end

  def next_step(bukva)

    if @status == -1 || @status == 1
      return
    end

    if @correct_letters.include?(bukva) || @wrong_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)

      @correct_letters << bukva

      if @correct_letters.uniq.sort == @letters.uniq.sort
        @status = 1
      end
    else

      @wrong_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end
  def ask_next_letter
    puts "\nВведите следующую букву"

    letter = ""
    while letter == ""
      letter = STDIN.gets.encode("UTF-8").chomp
    end
    next_step(letter)
  end

  def errors
    @errors
  end

  def letters
    @letters
  end

  def correct_letters
    @correct_letters
  end

  def wrong_letters
    @wrong_letters
  end
end
