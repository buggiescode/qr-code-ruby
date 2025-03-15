# Write your solution here!

require "rqrcode"

puts "This program generates QR codes"
puts "Would you like to 1. Encode a URL? 2. Join a WiFi network 3. Send a Text? 4. Exit program?"

choice = gets.chomp

if choice == "1"
  puts "What's the URL that you want to encode?"
  url_to_encode = gets.chomp
  qrcode = RQRCode::QRCode.new(url_to_encode)
  png = qrcode.as_png({ :size => 500 })
  IO.binwrite("UrlEncoded.png", png.to_s)
  puts "Thank you, your URL has been encoded"

elsif choice == "2"
  puts "What's the WiFi network name you want to connect to?"
  wifi_network = gets.chomp
  puts "What's the password for the network"
  wifi_password = gets.chomp
  qrcode = RQRCode::QRCode.new("WIFI:T:WPA;S:#{wifi_network};P:#{wifi_password}")
  png = qrcode.as_png({ :size => 500 })
  IO.binwrite("WifiEncoded.png", png.to_s)
  puts "Thank you, your Wifi Network and Password has been encoded"

elsif choice == "3"
  puts "What's the number you want to send a text to?"
  number = gets.chomp
  puts "What is the message that you want to send?"
  message = gets.chomp
  qrcode = RQRCode::QRCode.new("SMSTO:#{number}:#{message}")
  png = qrcode.as_png({ :size => 500 })
  IO.binwrite("TextEncoded.png", png.to_s)
  puts "Thank you, your text has encoded"

elsif choice == "4"
  puts "exit"
  exit
end
