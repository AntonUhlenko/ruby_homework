# 1-st variant:
# if ARGV[0] == ARGV[2] && ARGV[1] == ARGV[3]
#     puts 'Точка найдена!'
#   elsif ARGV[0] == ARGV[2] && ARGV[1] != ARGV[3]
#     puts 'х координата верна, y1 нет'
#   elsif ARGV[0] != ARGV[2] && ARGV[1] == ARGV[3]
#     puts 'y1 координата верна, x1 нет'
#   else
#     puts 'Близко, но нет'
#   end
# ====================================================

x1, y1, x2, y2 = ARGV

case
when x1 == x2 && y1 == y2
    puts 'Точка найдена'
  when x1 == x2 && y1 != y2
    puts 'х координата верна, y нет'
  when x1 != x2 && y1 == y2
    puts 'y координата верна, х нет'
  else
    puts 'Близко, но нет'
end






