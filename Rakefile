require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :awk

namespace :awk do
  task :parse_out do
    data_dir = File.expand_path('../data', __FILE__)
    `mkdir #{data_dir}` unless File.exists? data_dir

    awk_blob     = File.expand_path('../script/awk_blob.awk', __FILE__)
    awk_metadata = File.expand_path('../script/awk_metadata.awk', __FILE__)
    input_file   = File.expand_path('../data/input.bcp', __FILE__)
    output_blob_file     = File.expand_path('../data/output_blob.bcp', __FILE__)
    output_metadata_file = File.expand_path('../data/output_metadata.bcp', __FILE__)

    `time #{awk_blob} #{input_file} > #{output_blob_file}`
    puts 'About halfway.'
    `time #{awk_metadata} #{input_file} > #{output_metadata_file}`
    puts 'Done.'
  end
end
