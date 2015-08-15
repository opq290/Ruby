# -*- coding: utf-8 -*-
def transitions(automaton,input)
  s = 0
  for i in 0..input.length-1
    c = input[i..i].to_i # i文字目を取り出して、文字を数値に変換する。"0"を0、"1"を1とする。
    s = automaton[s][c]
  end
  return s
end

def test
  automaton = [[0,1], [2,0], [1,2]]
  p transitions(automaton,"011001")
  p transitions(automaton,"011011")
  p transitions(automaton,"011101")
end
