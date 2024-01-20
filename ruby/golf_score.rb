# frozen_string_literal: true

new_arr = []
p_arr = []

scores = {
  4 => 'コンドル',
  3 => 'アルバトロス',
  2 => 'イーグル',
  1 => 'バーディ',
  0 => 'パー',
  -1 => 'ボギー',
  -2 => '2ボギー',
  -3 => '3ボギー',
  -4 => '4ボギー',
  "HoleInOne" => 'ホールインワン'
}

2.times do
  arr = gets.chomp.split(',')
  new_arr << arr.map(&:to_i)
end

new_arr[0].each_with_index do |n, i|
  result = if (3..4).include?(n) && new_arr[1][i] == 1
             "HoleInOne"
           else
             n - new_arr[1][i]
           end
  p_arr << scores[result]
end

print p_arr.join(',')
