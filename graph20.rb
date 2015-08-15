# -*- coding: utf-8 -*-

class Graph
  attr_accessor :fmap, :adjMatrix

  def initialize(fname)
    f = open(fname)
    size = f.gets.to_i

    @adjMatrix = Array.new(size+1)
    for i in 0..size
      @adjMatrix[i] = Array.new(size+1,0)
    end
    @fmap = Array.new(size+1)
    
    while (s = f.gets) != nil do
      d1,d2 = s.split(/ /)
      connect1(d1.to_i,d2.to_i)
    end
    f.close
  end
  
  def connect1(x, y)
    @adjMatrix[x][y] = 1
  end

  def connected(x,y)
    return @adjMatrix[x][y] == 1
  end
  
  def to_s
    s = ""
    for i in 0..@adjMatrix.length-1
      for j in 0..@adjMatrix.length-1
        if @adjMatrix[i][j] == 1
          s += i.to_s + " " + j.to_s + "\n"
        end
      end
    end
    return s
  end
  
  def travx(d)
    for i in 0..@adjMatrix.length-1
      if connected(d,i)
        if @fmap[i] == nil # まだt[i]を訪れていなければ、
          @fmap[i] = d     # 頂点dから訪れたことを記録し、
          travx(i)         # 頂点t[j]から再帰的に辿る。
          @fmap[i] = 0     # 頂点dから訪れたことを消して、他から辿るのを許す
        else
          print "loop "
          j = d
          while j != i
            print j," "
            j = @fmap[j]
          end
          print i,"\n"
        end
      end
    end
  end
end

g = Graph.new(ARGV[0])
print g.to_s,"\n"

from = ARGV[1].to_i
g.travx(from)
