class Product
  attr_reader :length, :width, :height, :weight

  def initialize(length, width, height, weight)
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  def size
    length * width * height
  end
end