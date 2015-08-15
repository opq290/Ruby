# -*- coding: utf-8 -*-

class Graph
  def initialize(fname)
    f = open(fname)
    size = f.gets.to_i

    @list = Array.new(size+1)
    @fmap = Array.new(size+1)
    @how =  Array.new(size+1)
    for i in 0..@how.length-1
      @how[i] = Array.new()
    end
    while (s = f.gets) != nil do
      d1,d2,d3 = s.split(/ /)      # sを空白で区切り1番目をd1、2番目をd2に代入
      connect1(d1.to_i,d2.to_i,d3.chomp)
    end
    f.close
  end
 
  
  def connect1(x,y,z)
   
   @how[x][y]=[z]
    t = @list[x]
    if t == nil        # xの隣接リストがまだできていなければ、
      @list[x] = [y]   # 要素1つの配列とする。
    else
      if t.index(y) == nil # 既に含まれていなければ、
        t << y             # 追加する。
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
  
  def travx(from, to)
    q = Array.new             # Rubyの配列を待ち行列(queue)のように使う
    d = from
    while d != nil and d != to
      t = @list[d]
      if t != nil         # 隣接する頂点のリスト
      for i in 0..t.length-1  # 隣接する頂点のリストのそれぞれに対して、
        if @fmap[t[i]] == nil # まだt[i]を訪れていなければ、
          @fmap[t[i]] = d     # 頂点dから訪れたことを記録し、
          q << t[i]
        end
      end
      end
      d = q.shift             # qの先頭を取り出し(qからは除き)
    end
    if d == to                # 目的地に到着していたら、
      trace(to,from)          # 経路を示す。
    end
  end

  def trace(from, to)
    p=Array.new
    c=Array.new
    while from != to do
      print from," "
      p << from
      from = @fmap[from]
    end
     p << from
    print from,"\n"
    for i in 0..p.length-2
      c[i]=@how[p[p.length-i-1]][p[p.length-i-2]]
    end
    p c
 end

end


g = Graph.new(ARGV[0]) # ARGVは引数。ruby graph2.rb graph.dat 13 4とすると、ARGV[0]="graph.dat", ARGV[1]="13", ARGV[2]="4"
print g.to_s,"\n"

from = ARGV[1].to_i
to = ARGV[2].to_i
g.travx(from,to)

