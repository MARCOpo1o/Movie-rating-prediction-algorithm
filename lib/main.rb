require_relative "app/control.rb"

cntrl = Control.new('app/data/u1.base', 'app/data/u1.test')
puts "u1"
puts cntrl.run
