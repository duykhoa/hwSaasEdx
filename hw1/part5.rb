class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q"
      def #{attr_name}= value
        (!defined? @#{attr_name}_history) ? @#{attr_name}_history = [nil, value] : @#{attr_name}_history << value
      end
    "
      # def #{attr_name}=(value)
      #   defined? @#{attr_name}_history ? @#{attr_name}_history<<value : @#{attr_name}_history = [nil, value]
      # end
  end
end

class Foo
  attr_accessor_with_history :bar
  def initialize value=0
    @bar = value
  end
end

object = Foo.new
object.bar = 1
object.bar = 2
puts object.bar_history.inspect
