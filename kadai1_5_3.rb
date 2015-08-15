# -*- coding: utf-8 -*-
load"pg10r.rb"
t=pg10r
u=Array.new
for i in 0..t.length-1
  if t[i][1].length>=1000
    u << [t[i][0],t[i][1].length]
   end
end


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

b=sort(u,1).reverse
p b
