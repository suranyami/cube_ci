require "serialport"
require 'color'

port_str = "/dev/tty.usbmodem1421"  #may be different for you
baud_rate = 230400
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

inc = Math::PI / 20.0

sp.write("all BLACK\r")

begin
   while true do
      (0..20).each do |wave|
         for x in 0..3
            for y in 0..3
               for z in 0..3
                  x_off = (x.to_f / 16.0)
                  y_off = (y.to_f / 8.0)
                  z_off = (z.to_f / 4.0)
                  hue = (((wave.to_f / 20.0) + x_off +  y_off + z_off) * 360.0).to_i % 360
                  hsl = Color::HSL.new(hue, 100, 30)
                  color = hsl.html.gsub('#', '')
                  stuff = "set #{x}#{y}#{z} #{color}\r"
                  # puts "#{x_off} #{y_off} #{hue} #{stuff}"
                  sp.write(stuff)
                  sleep 0.01
               end
            end
         end
      end
   end
rescue Exception => e
   sp.close
end
