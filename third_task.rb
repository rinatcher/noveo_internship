# Первое задание
# Массивы
# Удаление максимального элемента
arr = [2,-1,3.6,10,3,5,1,1]
# p arr.delete_at(arr.index(arr.max))

#Сортировка стран по населению
data = [
  ['france', 67_000],
  ['usa', 300_000],
  ['russia', 146_000],
  ['germany', 83_000]
]

data.sort_by! { |row| row[1] }
# p data

#Возведение элементов массива в квадрат
arr.map! {|num| num**2}
# p arr

#Преобразование массива в хэш
hash = data.each_with_object({}) do|user, memo|
  memo[user.first] = user.last
end
# p hash

#Инверсия знаков элементов массива
inverse_arr = arr.flat_map {|num|[-num]}
# p inverse_arr

# Хэши
dict = {
  John: 'male',
  Alice: 'female',
  Matthew: 'male',
  Emma: 'female'
}
#Фильтр по значению
# p dict.select {|key, value| value == 'male'}

#Изменение значений хэша
# p dict.transform_values {|value| value.upcase}

#Слияние хэшей
dict1 = { a: 1, b: 2, c: 3 }
dict2 = { c: 4 }
# p dict1.merge(dict2)

#Получение массива значений хэша по ключам
# p dict.values_at(:John,:Emma)

#Преобразование хэша в массив
# p dict.to_a

#Интервалы
#Максимсльное и минимальное значение интервала
(10..20).max
(10..20).min

#Сравнение интервалов
(0..5).eql?(Range.new(0,5)) #true
(0...5).eql?(Range.new(0,5)) #false

#Получение начальных и последних элементов
(10..20).first(3)
(10...20).last(3)

#Задачи
# Задача а
def str_to_hash(str)
  arr = str.split(', ')
  arr.each_with_object({}) do|value, key|
    key[value[0]] = value[-1].to_i
  end
end
p str_to_hash "a=1, b=2, c=3, d=4"
# Задача б
def ranks(arr)
  arr.map {|num| arr.sort.reverse.index(num) + 1 }
end

p ranks [9,3,6,10]
p ranks [3,3,3,3,3,5,1]
