# -*- coding: utf-8 -*-
require 'set' # Setを使う時は入れる

def loadin(fn)
  s = Set.new() # 違うのはここ。
  f = open(fn)
  while line = f.gets
    s.add(line.chomp) 
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

def test
  s = loadin("johzu.dat")
  p s
  print pr(s),"\n"
  t = loadin("johosyori.dat")
  p t
  print pr(t),"\n"
  u = s + t
  p u
  print pr(u),"\n"
end
