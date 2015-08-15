# -*- coding: utf-8 -*-
load"Inokashira6.rb"

def find(t,s) # tの何番目にsがあるかを調べる
  i = 0
  while i < s.length && t[i] != s # 範囲を超えてなくて一致してなければ、
    i += 1 # 次に進む
  end
  return i # 一致するもがなければ、s.lengthとなる。
end

p find(stops,"東大前")

