# -*- coding: utf-8 -*-

class Graph
  def initialize(fname)
    f = open(fname)
    size = f.gets.to_i

    @list = Array.new(size+1)
    @fmap = Array.new(size+1)
    
    while (s = f.gets) != nil do
      d1,d2 = s.split(/ /)      # sを空白で区切り1番目をd1、2番目をd2に代入
      connect(d1.to_i,d2.to_i)  # d1,d2を数値に変換して接続
    end
    f.close
  end
  
  def connect(x, y)
    connect1(x,y)
    connect1(y,x)
  end
  
  def connect1(x, y)
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
def num(a,n)  #辺をn回辿って到達できる頂点からn-1回以下で到達できる頂点
  u=Array.new
  for i in 1..16
    if distance(a,i) == n
      u << i
    end
  end
  u
end  
  

  def distance(from, to)
    q = Array.new             # Rubyの配列を待ち行列(queue)のように使う
    d = from
    fmap=Array.new
    while d != nil and d != to
      t = @list[d]            # 隣接する頂点のリスト
      for i in 0..t.length-1  # 隣接する頂点のリストのそれぞれに対して、
        if fmap[t[i]] == nil # まだt[i]を訪れていなければ、
          fmap[t[i]] = d     # 頂点dから訪れたことを記録し、
          q << t[i]
        end
      end
      d = q.shift             # qの先頭を取り出し(qからは除き)
    end
    if d == to                # 目的地に到着していたら、
     k= Array.new
      while to != from do
        to=fmap[to]
        k << to
      end
       k.size
    else
      5000                # 経路を示す。
    end
  end

 
 def shortest(a,b,c)
    p=Array.new
    u=Array.new
    for i in 1..16
     p[i-1]=distance(a,i)+distance(b,i)+distance(c,i)
    end
    c=p.min
    k=p
   for j in 0..p.length-1
     if k[j] == c
       p j+1
     end
   end
   

 end


end



g = Graph.new(ARGV[0]) 
print g.to_s,"\n"

a=ARGV[1].to_i
b=ARGV[2].to_i
c=ARGV[3].to_i
p g.shortest(a,b,c)
p g.num(a,b)





