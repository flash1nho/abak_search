system('clear')
puts 'Идет загрузка программы...'

total = 10000000
data = []
(1..total).each do |item|
  ret = {}
  ret[:id] = item
  ret[:age] = Random.rand(100)
  ret[:salary] = Random.rand(1000000.0)
  ret[:length] = Random.rand(200)
  ret[:weight] = Random.rand(200)
  data << ret

  STDOUT.write "\r#{(item.to_f / total.to_f * 100).to_i} %" 
end
system('clear')

puts "\nВведите возраст или нажмите ENTER:"
age = gets.chomp.to_i
system('clear')

puts 'Введите зарплату или нажмите ENTER:'
salary = gets.chomp.to_f
system('clear')

puts 'Введите рост или нажмите ENTER:'
length = gets.chomp.to_i
system('clear')

puts 'Введите вес или нажмите ENTER:'
weight = gets.chomp.to_i
system('clear')

time_begin = Time.now

if age > 0
  puts 'Возраст: ' + data.select { |item|  item[:age] == age  }.count.to_s
else
  puts 'Возраст: был не указан'
end

if salary > 0.01
  puts 'Зарплата: ' + data.select { |item|  item[:salary] == salary  }.count.to_s
else
  puts 'Зарплата: была не указана'
end

if length > 0
  puts 'Рост: ' + data.select { |item|  item[:length] == length  }.count.to_s
else
  puts 'Рост: был не указан'
end

if weight > 0
  puts 'Вес: ' + data.select { |item|  item[:weight] == weight  }.count.to_s
else
  puts 'Вес: был не указан'
end

time_end = Time.now - time_begin 

puts 'Время поиска: ' + time_end.to_s + ' секунд'