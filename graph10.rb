# -*- coding: utf-8 -*-

class Graph
  attr_accessor :fmap

  def initialize(fname)
    f = open(fname)
    size = f.gets.to_i

    @list = Array.new(size+1)
    @fmap = Array.new(size+1)
    
    while (s = f.gets) != nil do
      d1,d2 = s.split(/ /)
      connect1(d1.to_i,d2.to_i)
    end
    f.close
  end
  
  def connect1(x, y)
    t = @list[x]
    if t == nil
      @list[x] = [y]
    else
      if t.index(y) == nil
        t << y
      end
    end
  end
  
  def to_s
    s = ""
    for i in 0..@list.length-1
      if t = @list[i]
        for j in 0..t.length-1
          s += i.to_s+" "+t[j].to_s+"\n"
        end
      end
    end
    return s
  end
  
  def travx(d)
    t = @list[d]            # 隣接する頂点のリスト
    if t != nil
      for i in 0..t.length-1  # 隣接する頂点のリストのそれぞれに対して、
        if @fmap[t[i]] == nil # まだt[i]を訪れていなければ、
          @fmap[t[i]] = d     # 頂点dから訪れたことを記録し、
          travx(t[i])         # 頂点t[j]から再帰的に辿る。
          @fmap[t[i]] = 0     # 頂点dから訪れたことを消して、他から辿るのを許す
        else
          print "loop "
          j = d
          while j != t[i]
            print j," "
            j = @fmap[j]
          end
          print t[i],"\n"
        end
      end
    end
  end
end

g = Graph.new(ARGV[0])
print g.to_s,"\n"

from = ARGV[1].to_i
g.travx(from)
