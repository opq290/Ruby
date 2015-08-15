# -*- coding: utf-8 -*-
class Dijkstra
  attr_accessor :list, :d, :prev

  class IdWeight               # 頂点番号と重みを記憶するクラス。Dijkstraだけで使うので内部で定義
    attr_accessor :id, :weight
    def initialize(id,weight)  # 
      @id = id
      @weight = weight
    end
  end
    
  class PriorityQueue            # 優先度付き待ち行列のクラス。Dijkstraだけで使うので内部で定義
    attr_accessor :pq, :pos, :dk
    def initialize(size,dk)
      @pq = Array.new(size)      # ヒープ木
      @pos = 0
      @dk = dk                   # 重みを使うグラフ
    end

    def heapUp(i)                                # 頂点iを追加
      if i > 0
        if @dk.d[@pq[parent(i)]] > @dk.d[@pq[i]]
          swap(parent(i),i)
          heapUp(parent(i))
        end
      end
    end

    def makeHeap(i)
      l = left(i)
      r = right(i)
      min = i
      if l < @pos && @dk.d[@pq[l]] < @dk.d[@pq[min]] # 町行列の要素は木の頂点番号。@dk.d[]を通すと重みになる。
        min = l
      end
      if r < @pos && @dk.d[@pq[r]] < @dk.d[@pq[min]]
        min = r
      end
      if min != i
        swap(i,min)
        makeHeap(min)
      end
    end
	
    def parent(i)
      return (i-1)/2
    end
    def left(i)
      return 2*i+1
    end
    def right(i)
      return 2*i+2
    end
	
    def swap(i,j)
      tmp = @pq[i]
      @pq[i] = @pq[j]
      @pq[j] = tmp
    end
	
    def pr()
      for i in 0..@pq.length-1
        print i," ",@pq[i],"\n"
      end
      print "pos=",@pos,"\n"
    end
	
    def enq(d)       # 町行列への追加
      @pq[@pos] = d  # ヒープ木の末尾に追加
      @pos += 1
      heapUp(@pos-1) # ヒープ木になるように調整
    end
	
    def deq()
      if @pos <= 0
        return nil
      end
      j = @pq[0]
      @pos -= 1
      @pq[0] = @pq[@pos]
      makeHeap(0)
      return j
    end

    def relax(u, v, weight)                                     # 頂点uから頂点vへの重みで行けることが分かった時の更新
      print "update ",u,"->",v," before weight=",@dk.d[v],"\n"
      if @dk.d[v] > @dk.d[u]+weight                             # 少ない重みで頂点vへ行けることが分かったら、
        @dk.d[v] = @dk.d[u]+weight
        print "update ",u,"->",v," after weight=",@dk.d[v],"\n"
        enq(v)                                                  # 頂点vを待ち行列に追加
        @dk.prev[v] = u
      end
    end
  end

  def initialize(size)      # Dijkstraの初期化
    @list = Array.new(size)
    @d = Array.new(size)
    @prev = Array.new(size)
  end

  def connect(x,y,w)
    if t = @list[x]
      for i in 0..t.length-1
        if t[i].id == y
          return
        end
      end
    else
      @list[x] = Array.new
    end
    @list[x] << IdWeight.new(y,w)
  end

  def dump()
    for i in 0..@list.length-1
      t = @list[i]
      for j in 0..t.length-1
        print i," ",t[j].id," ",t[j].weight,"\n"
      end
    end
  end

  def trav(s)
    size = @list.length

    for i in 0..size-1
      @d[i] = 1000 # 距離を∞にしておく
    end
    @d[s] = 0

    @pq = PriorityQueue.new(size,self) # このオブジェクトを@dkとして登録。重みを取り出すのに使用する
    @pq.enq(s) # 先頭の頂点を待ち行列に追加
	
    while u = @pq.deq() # 次の頂点がある間
      t = @list[u]
      for i in 0..t.length-1
        @pq.relax(u,t[i].id,t[i].weight) # 隣の頂点の重みを減らす。減った頂点は@pqに追加される。
      end
    end
  end

  def pr()
    for i in 0..@d.length-1
      print "d ",i," ",@d[i]," ",@prev[i],"\n"
    end
  end
end
def test
  dk = Dijkstra.new(5)
  dk.connect(0,1,10)
  dk.connect(0,3,5)
  dk.connect(1,2,1)
  dk.connect(1,3,2)
  dk.connect(2,4,4)
  dk.connect(3,1,3)
  dk.connect(3,2,9)
  dk.connect(3,4,2)
  dk.connect(4,0,7)
  dk.connect(4,2,6)
  dk.dump()
  dk.trav(0)
  dk.pr()
end
def test2
  dk = Dijkstra.new(5)
  dk.connect(0,1,40)
  dk.connect(0,3,70)
  dk.connect(1,2,50)
  dk.connect(1,3,80)
  dk.connect(2,3,10)
  dk.connect(2,4,20)
  dk.connect(3,2,10)
  dk.connect(3,4,60)
  dk.dump()
  dk.trav(0)
  dk.pr()
end
