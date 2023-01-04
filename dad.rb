require 'net/http'
require 'typewrite'

def joke_get
  uri = URI('https://icanhazdadjoke.com/')
  request = Net::HTTP.get(uri, { 'Accept' => 'text/plain' })
  Typewrite.write(request)
end

def opening
  puts "\n\n\n"
  Typewrite.write('So ya wanna hear a joke?', 0.1, 1, false)
  sleep(3)
  puts "\n\n\n"
  Typewrite.write('Here goes!', 0.1, 1, false)
  sleep(3)
  puts "\n\n"
  joke_get
  sleep(4)
  puts "\n\n\n"
  another_joke
end

def another_joke
  Typewrite.write('Do you want to hear another? [y/n]', 0.1, 0, false)
  puts
  answer = gets.chomp
  puts "\n\n\n"
  if answer == 'y' || answer == 'yes'
    sleep(1)
    joke_get
    sleep(4)
    puts "\n\n\n"
    another_joke
  else
    puts "\n\n"
    abort "Thanks for the laughs!\n\n"
  end
end

opening
