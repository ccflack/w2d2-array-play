require 'erb'

# 1
our_class = %w(Luiz Zachary Chris Brent Keith Michael Jon)

short = []

our_class.each {|name| short << name if name.length < 5}


# 2
sentence = "Ruby is actually kind of fun once you get used to it."

array = sentence.split(" ")
short_wd = []
array.each {|word| short_wd << word if word.length == 4}
print short_wd.inspect

# 3
movies = []
movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

def lowbud(array)
  selected =[]
  selected << array.select {|movie| movie[:budget] < 100}.collect {|movie| movie[:title]}
  selected
end

lb_result = lowbud(movies)
puts lb_result

def leo (array)
  selected = []
  selected << array.select {|movie| movie[:stars].include? "Leonardo DiCaprio"}.collect {|movie| movie[:title]}
  selected
end

leo_result = leo(movies)
puts leo_result

#Adventure Mode 1

def four_words(text)
  array = text.split(" ")
  short_wd = []
  array.each {|word| short_wd << word if word.length == 4}
  short_wd
end

w4_result = four_words (sentence)
puts w4_result

#Adventure Mode 2

def how_many_words(text, num)
  array = text.split(" ")
  num_wd = []
  array.each {|word| num_wd << word if word.length == num}
  num_wd
end

how_result = how_many_words(sentence, 3)
puts how_result

#Adventure Mode 3

def budg_total (array)
  budgets = []
  array.each do |movie|
    movie.each do |key, data|
      budgets << data if key == :budget
    end
  end
  total = 0
  budgets.each {|point| total += point }
  total
end

total_results = budg_total(movies)
puts total_results

#Epic Mode

puts "Maybe later"

#Legendary Mode

puts "Maybe later"

new_file = File.open("index.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
