require File.join(File.dirname(__FILE__), "..", "config", "boot")
require File.join(File.dirname(__FILE__), "..", "config", "environment")

file = File.new("seeds.rb", "w")

Challenger.all.each do |c|
  file << "Challenger.create!(name: '"
  file << c.name 
  file << "', email: '" 
  file << c.email 
  file << "')\n"
end
file.close