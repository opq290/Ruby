# -*- coding: utf-8 -*-
class Graph
  def initialize
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
  
  def travx(from, to)
    q = Array.new             # Rubyの配列を待ち行列(queue)のように使う
    d = from
    while d != nil and d != to
      t = @list[d]            # 隣接する頂点のリスト
      for i in 0..t.length-1  # 隣接する頂点のリストのそれぞれに対して、
        if @fmap[t[i]] == nil # まだt[i]を訪れていなければ、
          @fmap[t[i]] = d     # 頂点dから訪れたことを記録し、
          q << t[i]
        end
      end
      d = q.shift             # qの先頭を取り出し(qからは除き)
    end
    if d == to                # 目的地に到着していたら、
      trace(to,from)          # 経路を示す。
    end
  end

  def trace(from, to)
    k=Array.new
    while from != to do
      print from," "
      from = @fmap[from]
    end
    k << from
    print k
  end

def num(a,n)
  p=Array.new
  c=0
  while a!=nil && distance(a,
    b= a
    t=@list[b]
    for i in 0..t.length-1
      if @fmap[t[i]] == nil
        @fmap[t[i]] = b
        p << t[i]
        p1[j+1] << t[i]
      end
      if p1[j].index(@fmap[t[i]]) == nil
        j = j+1
      end
     b=q.shift
      c=c+1
    end
    if j == n
      c
    end
 end
end
      

  
end

g = Graph.new(ARGV[0]) # ARGVは引数。ruby graph2.rb graph.dat 13 4とすると、ARGV[0]="graph.dat", ARGV[1]="13", ARGV[2]="4"
print g.to_s,"\n"

a = ARGV[1].to_i
n = ARGV[2].to_i

g.num(a,n)
    
  
  
