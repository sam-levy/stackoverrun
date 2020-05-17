%w(javascript ruby python elixir).each do |topic|
  puts "Creating #{topic} topic"
  Topic.create!(title: topic)
end
puts "Finish!"