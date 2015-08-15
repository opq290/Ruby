# -*- coding: utf-8 -*-
load"longA.rb"
class Sma
  CHARS = 128
  def initialize(pat)                              # コンストラクタ
    @pat = pat                           # 検索したい文字列を記録
    @delta = Array.new(@pat.length+1)
    for i in 0..@delta.length-1
      @delta[i] = Array.new(CHARS,0)    # 状態 x 文字
    end
    for q in 0..@pat.length      # q文字目までマッチした状態で、
      for i in 0..CHARS-1      # 次の文字がiだった時、
        k = [@pat.length,q+1].min
        while !suffix(sub(@pat,0,k-1),@pat[0..q-1]+i.chr)
          k -= 1 # 次の文字を含めた時、k文字目まで検索文字列と一致
        end
        @delta[q][i] = k                   # 次の状態はk。iは文字コード(ASCII)
      end
    end
  end

  def sub(s,i,j)
    if i<=j
      s[i..j]
    else
      ""
    end
  end

  def suffix(s, body)  # sがbodyの接尾語
    s.length <= body.length && s == sub(body,-s.length,-1)
  end
  
  def match(t)                          # 状態遷移表を使って一致を検出
    q = 0                                 # 状態0からスタート
    for i in 0..t.length-1     # 入力文字列に従って、
      q = @delta[q][t[i]]             # 遷移を繰り返し、(t[i]は文字列tのi番目の文字の文字コード。i番目の文字そのものはt[i..i])
      if q == @pat.length
        print("match at ",(i+1-@pat.length),"\n") # 最終状態まで行ったら一致した位置を表示
      end
    end
  end
end
  
x = Sma.new("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab")        # 探したい文字列でオートマトンを作って準備しておく。
x.match(longA) #  マッチしたかどうかを表示する。
