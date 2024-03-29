# A tool for auto-detecting the names of locally connected USB FTDI/UART/Serial Devices
# Tested on Mac OSX and Linux (if you have Windows suggestions, please send a pull)

puts "Looking for locally connected serial devices"

device_styles = [
  "/dev/tty.usbserial*",  # Generic FTDI/UART Cable (also works with Bus-Pirate)
  "/dev/cu.usbserial*",   # Generic FTDI/UART Cable (also works with Bus-Pirate)
  "/dev/ttyUSB*",         # Generic Linux
  "/dev/tty.usbmodem*",   # Arduino
  "/dev/tty.KeySerial*"   # KeySpan Devices
  # ADD MORE AS IDENTIFIED
]

results = []

device_styles.each do |dev_style|
  Dir.glob(dev_style).each do |dev|
    results << dev
  end
end

puts "Found #{results.size} connected serial devices"
results.each {|d| puts "  * " + d}
