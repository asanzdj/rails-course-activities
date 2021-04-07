erroneous_password = true
attempts = 0
users = [
  { username: 'andrea', password: 'testme' },
  { username: 'willy', password: 'testme' },
  { username: 'admin', password: 'admin' }
]

def check_user(users, username, password)
  if users.any? { |user| user[:password].eql?(password) }
    puts "{ username: #{username}, password: #{password} }"
    erroneous_password = false
  else
    puts 'The password is incorrect'
  end
end

def print_welcome_text
  puts
  puts 'Welcome to the authenticator'
  puts
  puts
  puts 'This program will take input from the user and compare password'
  puts 'If the password is correct, you will get back the user object '
  puts
end

print_welcome_text

while erroneous_password && attempts < 5 do
  print 'Username: '
  username = gets.chomp.downcase

  print 'Password: '
  password = gets.chomp

  check_user(users, username, password)
  attempts += 1
end
