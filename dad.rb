require 'net/http'

def joke_get
  uri = URI('https://icanhazdadjoke.com/')
  request = Net::HTTP.get(uri, { 'Accept' => 'text/plain' })
  type_effect(request)
end

def opening
  puts "\n\n\n"
  type_effect('So ya wanna hear a joke?')
  sleep(3)
  puts "\n\n\n"
  type_effect('Here goes!')
  sleep(3)
  puts "\n\n"
  joke_get
  sleep(4)
  puts "\n\n\n"
  another_joke
end

def another_joke
  type_effect('Do you want to hear another? [y/n]')
  puts
  answer = gets.chomp
  puts "\n\n\n"
  if answer == 'y'
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

def type_effect(message)
  message_array = message.split('')
  message_array.each do |char|
    print char
    sleep(1.5) if char == '?' unless message_array.include?('[')
    sleep(0.1)
  end
end

opening
