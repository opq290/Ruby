# -*- coding: utf-8 -*-

class Graph 

  def initialize(fname) # ファイルfnameからグラフを読み込む
    f = open(fname)     # ファイルを開く
    size = f.gets.to_i  # ファイルの最初の数は最大の頂点番号
    
    @list = Array.new(size+1) # 隣接リストの配列
    @fmap = Array.new(size+1) # 探索する時に使う配列

    while (s = f.gets) != nil do  # 1行読み込み、
      d1,d2 = s.split(/ /)        # 空白を区切るとして前後に分け、
      connect(d1.to_i,d2.to_i)    # それぞれを数値にして頂点番号として、結ぶ
    end
    f.close                       # ファイルを閉じる
  end
  
  def connect(x, y) # 頂点xとyを結ぶ
    connect1(x,y)   # 無向グラフなので、x→yと
    connect1(y,x)   # y→xの両方を記録
  end
  
  def connect1(x, y) # x→yを記録
    t = @list[x]     # xからつながっているもののリスト
    if t == nil      # まだ空なら、
      @list[x] = [y] # xからつながっているものは[y]
    else
      if t.index(y) == nil # 既に登録されてないなら、
        t << y             # リストにyを追加する
      end
    end
  end
  
  def connected(x, y)         # xとyがつながっているかを判定する
    t = @list[x]              # xと繋がっているもののリストのなかに、
    return t != nil && t.index(y) != nil # yがあれば繋がっている
  end
  
  def dump                      # グラフの定義を表示
    for i in 0..@list.size-1
      if t = @list[i]           # iと繋がっているもののリストがあれば、
        for j in 0..t.length-1
          print i," ",t[j],"\n" # 表示する
        end
      end
    end
  end
  
  def travx(from, d, to)  # 頂点fromからtoまで辿る。現在は頂点d。
    if d == to then       # 目的の頂点toに到達していたら、
      trace(to,from)      # そこからfromまで逆に辿る。
      return
    end
    for i in 0..@list.size-1                # 全ての頂点に対して、
      if connected(d,i) and @fmap[i] == nil # dとiが繋がっていて、頂点iをまだ辿ってなければ、
        @fmap[i] = d                        # 頂点iの前がdであることを記録し、
        travx(from,i,to)                    # 再帰的にiから辿る
      end
    end
  end
  
  def trace(from, to)    # 頂点fromからtoまでfmapで戻る
    while from != to do  # toにたどり着くまで、
      print from," "     # fromを表示し、
      from = @fmap[from] # 一つ前に戻る。
    end
    print from,"\n"      # まだ表示してないtoを表示して終わる。
  end
end

g = Graph.new(ARGV[0]) # 引数で指定されたファイルからグラフを読み込む。
g.dump()               # グラフの定義を表示する

from = ARGV[1].to_i    # ２番目の引数の頂点fromから、
to = ARGV[2].to_i      # ３番目の引数の頂点toまで、
g.travx(from,from,to)  # 辿る。
