@programs = `ls -r /usr/share/gopreload/enabled | cut -f 1 -d '.'`.split("\n")
@programs.each do |program|
  puts "-------------------------------"
  puts "                               "
  puts "      prepare #{program}       "
  puts "                               "
  puts "-------------------------------"
  system("gopreload-prepare #{program}")
end
