require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

#1を選択
if memo_type == 1
 puts "拡張子を除いたファイル名を入力してください。"
 file_name_new = gets.chomp.to_s
 p "入力したい内容を入力してください。"
 p "完了したら改行してCtrl+Dを押してください。"
 CSV.open("#{file_name_new}.csv","w") do |contents_new|
   new_memo_contents = readlines
   contents_new << new_memo_contents
 end
#2を選択
elsif memo_type == 2
  puts "編集したいファイル名を拡張子を除いて入力してください。"
  file_name_edit = gets.chomp.to_s
  p "追記したい内容を入力してください。"
  p "完了したら改行してCtrl+Dを押してください。"
  CSV.open("#{file_name_edit}.csv","a") do |contents_edit|
    edit_memo_contents = readlines
    contents_edit << edit_memo_contents
  end
end
