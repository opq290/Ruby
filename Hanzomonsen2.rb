# -*- coding: utf-8 -*-
load"Denentoshisen.rb"
denentoshisen = stops # それぞれの路線名の変数に代入しておく
load"Hanzomonsen.rb"
hanzomonsen = stops
load"Isesakisen.rb"
isesakisen = stops
load"Nikkosen.rb"
nikkosen = stops

def cross(line1,line2)            # 交点を求める関数
  for i in 0..line1.length-1
    if j = line2.index(line1[i])  # 見つからなかった場合はnilを返すので条件が成立しない。それ以外は成立
      return [i,j]                # 途中で関数から帰る。返り値は要素数2の配列[i,j]
    end
  end
end

def join(line1,line2)
  i,j = cross(line1,line2)       # 返り値の要素数2の配列のそれぞれの要素をiとjに代入
  line1[0..i]+line2[j+1..-1]     # ooimachi[i]とdenentoshisen[j]が一致しているので、そこで結合。-1は末尾の添字。
end

t = join(join(join(denentoshisen.reverse,hanzomonsen),isesakisen),nikkosen) # 田園都市線は逆順なのでreverseでリストを反転
print t * ",","\n"
p t.length               # 駅数
print t[t.length/2],"\n" # 中間駅（駅数が偶数の場合は要注意）
