require_relative 'tryable'
require_relative 'proc_num'

# Реализация метода, который будет возвращать nil, если для объекта нельзя вызвать указанный метод.
# Метод должен находиться в модуле и получать параметром блок.

p false.try { even? } # nil
p false.try(&:even?) # nil
p 2.try(&:even?) # true
p 1.try { |obj| obj + 1 } # 2
p true.try { |obj| obj + 1 } # nil
# 1.try { |obj| obj + '' } # it still should raise error “String can't be coerced into Integer”

# Реализовать метод, который принимает один параметр с числом, а возвращает объект proc,
# который можно использовать для добавления переданного числа к другим числовым значениям.

p add_num_1 = add_num(1) # proc

p add_num_1.call(3) # 4
p add_num_1.call(5.7) # 6.7

p add_num_m10 = add_num(-10)

p add_num_m10.call(44) # 34
p add_num_m10.call(-20) # -30