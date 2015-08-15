# -*- coding: utf-8 -*-
require 'set' # SortedSetを使う時は入れる

def loadin(fn)
  s = SortedSet.new() # ソートリストによる集合
  f = open(fn)
  while line = f.gets
    s.add(line.chomp) # １行ごとに集合に追加する
  end
  f.close
  return s
end

def pr(a)
  s = ""
  sep = "{"
  a.each do |e| # 集合の各要素eに対して、(イテレータ)
    s += sep
    sep = ","   # 2回目以降は","を区切りとする
    s += e.to_s # 要素を文字列にして追加
  end
  return s+"}"
end

def test
  s = loadin("mushroom4.dat")     # johzu.datを読み込み
  p s
  print pr(s),"\n"
  t = loadin("johosyori.dat") # johosyori.datを読み込み
  p t
  print pr(t),"\n"
  u = s + t        # 集合の和を計算する
  p u
  print pr(u),"\n" 
end
