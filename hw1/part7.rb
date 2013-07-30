class CartesianProduct
  include Enumerable
  attr_reader :cartesian
  def initialize a = [], b = []
    @cartesian = []
    a.each do |i|
      b.each do |j|
        @cartesian<<[i,j]
      end
    end
    @cartesian
  end
  def each &block
    self.cartesian.each(&block)
  end
end
