def load
  f = open("pi10m.ascii.01of10")
  x = [3]
  while line = f.gets
    line.chomp.split(/ /).each { |v|
      v.split(//).each { |w|
        x << w.to_i
      }
    }
  end
  f.close
  x
end

p load


