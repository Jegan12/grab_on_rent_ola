module CalculateDistance

  def distance(p1, p2)
    lat = (p1[0] - p2[0])**2
    long = (p1[1] - p2[1])**2
    square_root(lat, long)
  end

  def square_root(p1, p2)
    Math.sqrt(p1 + p2)
  end
end