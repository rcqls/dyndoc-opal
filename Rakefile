require 'opal'

minify   = ENV['MINIFY'] == '1'
compress = ENV['COMPRESS'] == '1'

task :default => :dist

desc 'Build opal.js and dyndoc.js to build/'
task :dist do
  Opal::Processor.method_missing_enabled = false
  Opal::Processor.const_missing_enabled = false
  Opal::Processor.source_map_enabled = false
  Opal::Processor.dynamic_require_severity = :warning

  Dir.mkdir 'build' unless File.directory? 'build'

  env = Opal::Environment.new
  env.js_compressor = Sprockets::ClosureCompressor if minify

  # Use use_gem if you want to build against a release
  # env.use_gem 'dyndoc-ruby'
  # If the Gemfile points to a git repo or local directory, be sure to use `bundle exec rake ...`
  # Use append_path if you want to build against a local clone
  env.append_path '.'

  dyndoc = env['src/dyndoc.rb']
  full_source = dyndoc.to_s
  File.open("build/dyndoc.js#{compress ? '.gz' : nil}","w") do |f|
    f << full_source.gsub(/(var\ Opal)/,'//disabled (see before): \1')
  end


end
