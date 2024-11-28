# Easy web site generator

require 'rake/clean'
require 'webrick'

require './lib/easy.rb'

# Target folder must be absolute
TARGET = Dir.pwd + '/www'

CLEAN.include TARGET

desc "Build site"
task :build => :clean do
  builder = Easy.new(TARGET)
  builder.process
end

desc "Install on localhost"
task :install => :build do
  system("sudo cp -r www /srv/")
end

desc "Deploy on Gandi VPS"
task :deploy => :build do
  system("scp -r www wylie:/srv/")
end

desc 'Run server'
task :run do
  server = WEBrick::HTTPServer.new(:Port => 8080, :DocumentRoot => TARGET)
  trap('INT') { server.stop }
  server.start
end

