#!/usr/bin/ruby

# Comparable 模块
# incluede之后
# 实现 <=> 操作符可免费得到 < <= == >= >  bewteen  六个方法
#

class Song
  include Comparable
  attr_accessor :duration
  def initialize(name,artist,duration)
    @name = name
    @artist = artist
    @duration = duration
  end
  def <=>(other)
    self.duration <=> other.duration
  end
end

song1 = Song.new("my Way","Sinatra",225)
song2 = Song.new("Bicyclops","fleck",260)

puts song1.inspect

song1 <=> song2
song1 < song2
song1 == song2

# Composing Modules
# include 之后
# 实现 each 方法 自动添加inject compact  等方法
#

class VoweHelper
  include Enumerable

  def initialize(string)
    @string = string
  end

  def each 
    @string.scan(/[aeiou]/) do |vowe|
      yield vowe
    end
  end
end

vf = VoweHelper.new('the quick brown fox jumped')
puts vf.inject {|v,n| v+n}

# 我们可以使用一个模块封装这个求和功能

module Summable
  def sum 
    inject {|v,n| v + n}
  end
end

class Hello
  include Summable,Enumerable
  def initialize(string)
    @string = string
  end
  def each 
    @string.scan(/[aeiou]/) do |vowe|
      yield vowe
    end
  end
end

nf = Hello.new('the quick brown fox jumped')
puts nf.sum

#  运行时特点

5.times do |i|
  File.open('temp.rb','w') do |f|
    f.puts "module Temp"
    f.puts "def Temp.var"
    f.puts " #{i} "
    f.puts "end"
    f.puts "end"
  end
  load "temp.rb"
  puts Temp.var
end

# 基本输入和输出

print "Enter your name:"
name = gets


IO.foreach("../../tmp.txt:") {|line| puts line}
# 以读模式打开文件，并以文件的每一行行为参数调用关联的迭代器，最后自动关闭文件

str = IO.read("../../tmp.txt")
str.length
str[2,40]

arr = IO.readlines("../../tmp.txt")
arr.length
arr[0]

# 写文件
































