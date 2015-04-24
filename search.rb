def parse_get(get)
  begin
    get = eval(get)
    if [Fixnum, Float, Range].include?(get.class)
      if get.is_a?(Float)
        [(sprintf "%.1f", get).to_f]
      elsif get.is_a?(Fixnum)
        [get]
      else
        begin
          get.to_a
        rescue
          get.step.to_a
        end
      end
    end
  rescue SyntaxError => e
    puts "Введен неверный тип"
    exit
  end
end

def get_count(get, cur)
  count = 0
  get.each do |t|
    next if cur[t.to_i].nil? && cur[t.to_f].nil?
    count += cur[t]
  end
  count.to_i
end

system('clear')
puts 'Идет загрузка программы...'
 
age = {} # Hash[(0..100).map { |num| [num, 0] }]
salary = {} #Hash[(0.0..1000000.0).step(0.1).map { |num| [(sprintf "%.1f", num).to_f, 0] }]
length = {} #Hash[(0..200).map { |num| [num, 0] }]
weight = {} #Hash[(0..200).map { |num| [num, 0] }]
total = 10000000
(1..total).each do |t|
  key = Random.rand(100)
  age[key] ||= 0
  age[key] += 1

  key = (sprintf "%.1f", Random.rand(1000000.0)).to_f
  salary[key.to_i] ||= 0
  salary[key.to_i] += 1

  key = Random.rand(200)
  length[key] ||= 0 
  length[key] += 1
  
  key = Random.rand(200)
  weight[key] ||= 0
  weight[key] += 1

  STDOUT.write "\r#{(t.to_f / total.to_f * 100).to_i} %" 
end
system('clear')

puts "\nВведите возраст(0..100) или нажмите ENTER:"
get_age = parse_get(gets.chomp)
system('clear')

puts 'Введите зарплату(0..1000000) или нажмите ENTER:'
get_salary = parse_get(gets.chomp)
system('clear')

puts 'Введите рост(0..200) или нажмите ENTER:'
get_length = parse_get(gets.chomp)
system('clear')

puts 'Введите вес(0..200) или нажмите ENTER:'
get_weight = parse_get(gets.chomp)
system('clear')

time_begin = Time.now

result_age = get_count(get_age, age)
result_salary = get_count(get_salary, salary)
result_length = get_count(get_length, length)
result_weight = get_count(get_weight, weight)
total_count = result_age + result_salary + result_length + result_weight

puts 'Возраст: ' + result_age.to_s
puts 'Зарплата: ' + result_salary.to_s
puts 'Рост: ' + result_length.to_s
puts 'Вес: ' + result_weight.to_s
puts 'Всего: ' + total_count.to_s

time_end = Time.now - time_begin 

puts 'Время поиска: ' + time_end.to_s + ' секунд'