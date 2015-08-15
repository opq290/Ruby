# -*- coding: utf-8 -*-
class Graph
  def initialize(fname)
    f = open(fname)
    size = f.gets.to_i
    @list2=Array.new(size+1)
    @list = Array.new(size+1)
    @fmap = Array.new(size+1)
    @fmap2=Array.new(size+1)
    
    while (s = f.gets) != nil do
      d1,d2 = s.split(/ /)      # sを空白で区切り1番目をd1、2番目をd2に代入
      connect(d1.to_i,d2.to_i)
      connectt(d1.to_i,d2.to_i)# d1,d2を数値に変換して接続
    end
    f.close
  end
  def connectt(x,y)
    connect2(x,y)
    connect2(y,x)
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



def connect2(x,y)
  s=@list2[x]
  k=@list[y].delete(x)
    if k != nil
      for i in 0..k.length-1
        if s == nil
          @list2[x]=[k[i]]
        else
          if s.index(k[i]) == nil
            s << k[i]
          end
        end
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
      if @list2[d] != nil
        t = @list2[d]            # 隣接する頂点のリスト
        for i in 0..t.length-1  # 隣接する頂点のリストのそれぞれに対して、
          if @fmap[t[i]] == nil # まだt[i]を訪れていなければ、
            @fmap[t[i]] = d     # 頂点dから訪れたことを記録し、
            q << t[i]
          end
        end
        d = q.shift             # qの先頭を取り出し(qからは除き)
      end
     end
      if d == to                # 目的地に到着していたら、
        trace(to,from)          # 経路を示す。
      end
  end

 def trace(from, to)
    while from != to do
      print from," "
      from = @fmap[from]
    end
    print from,"\n"
  end
 def to_s2
    s = ""
    for i in 0..@list2.length-1
      if t = @list2[i]
        for j in 0..t.length-1
          s += i.to_s+" "+t[j].to_s+"\n"
        end
      end
    end
    return s
  end
  
  def travx2(from, to)
    q = Array.new             # Rubyの配列を待ち行列(queue)のように使う
    d = from
    while d != nil and d != to
      t = @list2[d]            # 隣接する頂点のリスト
      for i in 0..t.length-1  # 隣接する頂点のリストのそれぞれに対して、
        if @fmap2[t[i]] == nil # まだt[i]を訪れていなければ、
          @fmap2[t[i]] = d     # 頂点dから訪れたことを記録し、
          q << t[i]
        end
      end
      d = q.shift             # qの先頭を取り出し(qからは除き)
    end
    if d == to                # 目的地に到着していたら、
      trace2(to,from)          # 経路を示す。
    end
  end

  def trace2(from, to)
    while from != to do
      print from," "
      from = @fmap2[from]
    end
    p @list2
  end
end

g = Graph.new(ARGV[0]) # ARGVは引数。ruby graph2.rb graph.dat 13 4とすると、ARGV[0]="graph.dat", ARGV[1]="13", ARGV[2]="4"
print g.to_s,"\n"

from = ARGV[1].to_i
to = ARGV[2].to_i
g.travx2(from,to)

