require 'highline/import'
colors = %w{black red green yellow blue magenta cyan white}

# sisyphus' accoutrements
def annihalate
  puts "\e[H\e[2J"
end
def say_slowly(text)
  sleep(1)
  say text
  sleep(4)
end
def couldnt_understand
  responses = ["I'm not cut out for this.", "Is that it?", "Why?", "No."]
  puts responses.sample
end
def title
  <<-eos

               _     ___ _           _ 
     _ _ ___ _| |___|  _|_|___ ___ _| |
    | | |   | . | -_|  _| |   | -_| . |
    |___|_|_|___|___|_| |_|_|_|___|___|
                                   
  eos
end

class Room
  attr_accessor :description

  def initialize(description)
    @description = description
  end

  def prompt(choices)
    input = ask("> ")
    chosen = choices.grep(/#{input}/)
    if chosen.empty?
      couldnt_understand
      prompt choices
    else
      self.send input
    end
  end
  def look
    say_slowly description
  end
end

annihalate
sleep(2)
say("<%= color(title, :cyan)%>")
name = ask("What is your <%= color('name', :red) %>, traveller?")
sleep(2)
annihalate

say_slowly "It's been a long time since you've seen home."
say_slowly "Space is as lonely as you expected."
say_slowly "Life, like the lightyears between you and Alpha Centauri \nhas been slowly diminishing for several years now."
say_slowly "All in a lifetime's work for you, Cadet #{name}."
say_slowly "The viewport, static and unchanging."
say_slowly "Listen."
say_slowly "But hear nothing."

say_slowly "<%= color('Stopped.', :red) %>"

cockpit = Room.new("But you don't know what you're looking for.")
cockpit.prompt(%w(look))