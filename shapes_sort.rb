class Shape
  def to_s
    "#{self.class}"
  end
  def <=>(shape)
    self.area <=> shape.area
  end
end

class Square < Shape
  def initialize(a)
    @a = a
  end
  def area
    @a * @a
  end
end
class Rectangle < Shape
  def initialize(a,b)
    @a = a
    @b = b
  end
  def area
    @a * @b
  end
end
class Triangle < Shape
  def initialize(a,h)
    @a = a
    @h = h
  end
  def area
    @a * @h * 0.5
  end
end
class Circle < Shape
  def initialize(r)
    @r = r
  end
  def area
    @r * @r * Math::PI
  end
end
class CustomShape < Shape
  def initialize(area)
    @area = area
  end
  def area
    @area
  end
end
shapes = [Square.new(5), Rectangle.new(5,6), Triangle.new(5,8), Circle.new(4), CustomShape.new(24)]
puts shapes.sort
