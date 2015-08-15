# -*- coding: utf-8 -*-
load"pg10_10000.rb"
def swap(u,i,k) # 配列中のi番目とk番目のデータの入れ替え
  tmp = u[i]
  u[i] = u[k]
  u[k] = tmp
end

def sort(u,m) # uのm番目の要素をキーとしてソートする関数。とりあえずここでは単純ソート。
  for i in 0..u.length-2
    k = i
    for j in i+1..u.length-1
      if u[j][m] < u[k][m] # m番目が比較対象のキー
        k = j
      end
    end
    swap(u,i,k)
  end
  return u
end

def genIndex(t) # 索引を作る
  u = Array.new
  for i in 0..t.length-1
    u[i] = [t[i],i] # [ ..., ["東大前",2], ... ]のようにキーと元の位置をペアにしておく。
  end
  return sort(u,0) # 0番目をキーとしてソートする
end

t=genIndex(pg10_10000)
    
p t.select{|e|"God"==e[0]}
p t.select{|e|"god"==e[0]}
