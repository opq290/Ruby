# -*- coding: utf-8 -*-
require 'set'

def loadin(fn)
  s = Array.new
  f = open(fn)
  while line = f.gets
    s << line.chomp
  end
  f.close
  return s
end

def pr(a)
  s = ""
  sep = "{"
  a.each do |e| 
    s += sep
    sep = ","
    s += e.to_s
  end
  return s+"}"
end

def union(a,b)   # aとbの和集合を求める。
  r = Array.new  # 結果を格納する配列を作る
  while a.length > 0 && b.length > 0 do # aとbの両方が空でない時、
    if a[0] < b[0]       # aとbがそれぞれ昇順に並んでいるので、それぞれの最小である先頭を比較する
      r << a.shift       # aの最小の方が小さければそちらを結果に入れる。
    else
      if a[0] > b[0]       # bの最小の方が小さければそちらを結果に入れる。
        r << b.shift
      else # a[0] == b[0]  # 等しければ、
        r << a.shift       # 同じ値なので、どちらかを（ここではaの最小を）結果に入れ、
        b.shift            # 他方は読み捨てる
      end
    end
  end
  r = r + a # aに残りがあれば追加。空でないのはどちらか一方だけなので、
  r = r + b # bに残りがあれば追加。この２行の順序は関係ない。
  return r
end

def test
  s = loadin("johzu.dat")
  p s
  print pr(s),"\n"
  t = loadin("johosyori.dat")
  p t
  print pr(t),"\n"
  u = union(s,t)
  p u
  print pr(u),"\n"
end
