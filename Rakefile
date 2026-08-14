# Easy web site generator

require 'rake/clean'
require 'puma'

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

desc "Deploy on VPS"
task :deploy => :build do
  system("cat .netrc macdef >$HOME/.netrc")
  system("ftp ftp.cluster121.hosting.ovh.net")
end

desc 'Run server'
task :run do
  system("rackup --port 8080 --server puma")
end

