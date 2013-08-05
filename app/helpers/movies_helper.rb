module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def is_checked ratings, rating
    "checked:true" if !ratings || ratings.map{ |k,v| k }.include?(rating)
  end
end
