class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def triangle_checker
    valid_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |side|
      valid_triangle << false if side <= 0
      raise TriangleError if valid_triangle.include?(false)
    end
  end

  def kind
    triangle_checker
    if a == b && b == c
      return :equilateral
    elsif a == b || b == c || a == c
      return :isosceles
    else
      return :scalene
    end
  end
  
  class TriangleError < StandardError
  end

end
