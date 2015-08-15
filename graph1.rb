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
      connect(d1.to_i,d2.to_i)
    end
    f.close
  end
  
  def connect(x, y)
    connect1(x,y)
    connect1(y,x)
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
  
  def travx(from, d, to)
    if d == to
      trace(to,from)
      return
    end
    t = @list[d]            # 隣接する頂点のリスト
    for i in 0..t.length-1  # 隣接する頂点のリストのそれぞれに対して、
      if @fmap[t[i]] == nil # まだt[i]を訪れていなければ、
        @fmap[t[i]] = d     # 頂点dから訪れたことを記録し、
        travx(from,t[i],to) # 頂点t[i]から再帰的に辿る。
      end
    end
  end

  def trace(from, to)
    while from != to do
      print from," "
      from = @fmap[from]
    end
    print from,"\n"
  end
end

g = Graph.new(ARGV[0])
print g.to_s,"\n"

from = ARGV[1].to_i
to = ARGV[2].to_i
g.travx(from,from,to)
