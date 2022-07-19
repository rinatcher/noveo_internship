# Нужно реализовать класс Vector с соответствующими методами по сложению,
# вычитанию векторов. Если оперируемые векторы разной длины, то это должна быть ошибка или nil результат.

# Тестовые варианты

# a = Vector.new([1, 2, 3])
# b = Vector.new([3, 4, 5])
# c = Vector.new([5, 6, 7, 8])

# a.add(b)      # should return a new Vector([4, 6, 8])
# a.subtract(b) # should return a new Vector([-2, -2, -2])
# a.dot(b)      # should return 1*3 + 2*4 + 3*5 = 26
# a.norm()      # should return sqrt(1^2 + 2^2 + 3^2) = sqrt(14)
# a.add(c)      # throws an nil
# a.to_s        # (1, 2, 3)

class Vector
  attr_reader :vector, :other
  def initialize(vector)
    @vector = vector
  end

  def [](x)
    @vector[x]
  end

  def size
    len = 0
    @vector.each { |el| len += 1 }
    len
  end

  def add(other)
    if @vector.size != other.size
      nil
    else
      (0...@vector.length).map{ |i| @vector[i] + other[i] }
    end
  end

  def subtract(other)
    if @vector.size != other.size
      nil
    else
      (0...@vector.length).map{ |i| @vector[i] - other[i] }
    end
  end

  def dot(other)
    if @vector.size != other.size
      nil
    else
      (0...@vector.length).map{ |i| @vector[i] * other[i] }.sum
    end
  end

  def norm
    Math.sqrt(@vector.map{ |num| num ** 2}.sum)
  end

  def to_s()
    "(#{@vector})".gsub(/"|\[|\]/,'')
  end

  def vector
    @vector
  end
end

a = Vector.new([1, 2, 3])
b = Vector.new([3, 4, 5])
c = Vector.new([5, 6, 7, 8])
p a.add(b)      # should return a new Vector([4, 6, 8])
p a.subtract(b) # should return a new Vector([-2, -2, -2])
p a.dot(b)      # should return 1*3 + 2*4 + 3*5 = 26
p a.dot(c)      # throws an nil
p a.norm        # should return sqrt(1^2 + 2^2 + 3^2) = sqrt(14)
p a.add(c)      # throws an nil
p a.subtract(c) # throws an nil
p a.to_s        # (1, 2, 3)
