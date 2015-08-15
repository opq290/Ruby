# -*- coding: utf-8 -*-
load"Denentoshisen.rb"

skipStops = Array.new # 空を入れるリストを生成
j = 0                 # 急行の止まる駅
count = -1
for i in 0..stops.length-1
  if stops[i] == expressStops[j] # この駅が急行の止まる駅なら、
    if count >= 0                # 最初でなければ、
      skipStops << count         # リストの末尾に追加
    end
    j += 1     # 急行の次の駅、
    count = 0  # 急行間のカウンターをリセット
  else         # この駅が急行の止まらない駅なら、
    count += 1 # 急行間のカウンターをインクリメント
  end
end

p skipStops
