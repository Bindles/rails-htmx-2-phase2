foods = [ {name: 'apple', type: 'fruit'},
          {name: 'orange', type: 'fruit'},
          {name: 'broccoli', type: 'vege'},
          {name: 'green beans', type: 'vege'} ]

foodz = ["a", "bb", "ccc"]

for food in foods
  p food if food[:type]=='vege'
end

p '--'
p foods.sort_by { |sortfood| sortfood[:type]}
p foods.sort { |a,b| b[:type] <=> a[:type]}
foods.map { |t| p t[:name] if t[:type]=="vege"}


# Use pluck to extract :type values for vegetables
vegetable_types = foods.select { |food| food[:type] == 'vege' }

# Output the results
p vegetable_types

p [1,2,3,4,5,6,7,8].select { |sel| sel % 2 == 0 }

numbers = [1, 2, 3, 4]
sum = numbers.reduce { |acc, num| acc + num }
puts sum
# Output: 10

p doubled_numbers = [1, 2, 3].map { |num| num + 1 }

p odd_numbers = [1, 2, 3, 4, 5].reject { |num| num.even? }
