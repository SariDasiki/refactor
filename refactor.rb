def point_puts
    puts "ポイントを1から5で入力してください"
    point = gets.to_i
    return point
  end
  
  def number_select
    puts "実施したい処理を選択してください"
    puts "1:評価ポイントとコメントを入力する"
    puts "2:今までの結果を確認する"
    puts "3:やめる"
    num = gets.to_i
  
    return num
  end
  
  def puts_comments_points(point,comment)   
    if comment.chomp.match(/\A\d+\z/)
      puts "文字を入力してください"
    else
      post = "ポイント：#{point} コメント：#{comment}"
  
      File.open("data.txt", "a") do |file|
        file.puts(post)
      end
      ## 処理見直すかも？
      return point,comment
    end
  end
  
  while true
    num = number_select
  
    case num
    when 1
      point = point_puts
      while true
        if point <= 0 || point > 5
          puts "ポイントを1から5で入力してください"
          point = gets.to_i
        else
          puts "コメントを入力してください"
          comment = gets
          puts_comments_points(point,comment)
          break
        end
      end
    when 2
      puts "これまでの結果"
      File.open("data.txt", "r") do |file|
        file.each_line do |line|
          puts line
        end
      end
  
    when 3
      puts "終了します"
      break
    else
      puts "1から3で入力してください"
    end
  end
  