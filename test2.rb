#!/usr/bin/ruby -w 
#-r profile

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

IO.foreach("../../tmp.txt") {|line| puts line}
# 以读模式打开文件，并以文件的每一行行为参数调用关联的迭代器，最后自动关闭文件

str = IO.read("../../tmp.txt")
str.length
str[2,40]

arr = IO.readlines("../../tmp.txt")
arr.length
arr[0]

# 写文件

# 网络层 
# socket  底层  net/http  上层 open-uri  更顶层的包装

# Threads  and Processes
#

#require 'net/http'
#pages = %w{www.baidu.com www.qq.com}
#threads = []
#for pages_fetch in pages
#  threads << Thread.new(pages_fetch) do |url|
#    h = Net::HTTP.new(url,80)
#    puts "fetching: #{url}"
#    resp = h.get('/',nil)
#    puts "Got #{url}: #{resp.message}"
#  end
#end
#
#puts Thread.current
#puts "******************"
#puts "list is",Thread.list
#puts "******************"
#puts threads.each {|thr| thr.join}

# 子线程共享主线程变量，且可以通过散列表的方式，供主线程访问子线程内的局部变量
#

count = 0
thread = []
10.times do |i|
  thread[i] = Thread.new do
    sleep(rand(0.1))
    Thread.current["mycount"] = count
    count += 1
  end
end

thread.each {|t| t.join;print t["mycount"],", "}
puts "count = #{count}"

#  多线程中避免使用  puts  应使用  print "\n"  因为可能输出换行时，不同的线程输出会交织到一块

#  ruby  线程同步的原语很难被掌握，大家提出了更高级的替代方法，即更高层的封装  如 monitor（监视器）
 
#require 'monitor'
#class Counter
#  include MonitorMixin
#  attr_reader :count
#  def initialize
#    @count = 0
#  end
#
#  def tick
#    synchronize do
#      @count += 1
#    end
#  end
#end
#
#c = Counter.new
#
#t1 = Thread.new {100_000.times {puts "c is #{c.inspect}";c.tick}}
#t2 = Thread.new {100_000.times {c.tick}}
#
#t1.join;t2.join
#puts c.count


#  运行多个进程

puts `date`
puts system("brew search pig")

brew = IO.popen("/usr/bin/say","w+")
brew.puts "hello world"
brew.close_write
puts brew.gets

# Unit Test
# assert  通过 ri 命令查看 Test::Unit 文档






















