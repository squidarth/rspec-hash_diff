Gem::Specification.new do |s|
  s.name = "rspec-hash_diff"
  s.version = "0.0.0"
  s.date = "2017-01-08"
  s.summary  = "A library for rspec that displays better hash diffs"
  s.authors = ["Sid Shanker"]
  s.files = ["lib/rspec-hash_diff.rb"]
  s.license = "MIT"
  s.add_runtime_dependency 'hashdiff'
  s.add_runtime_dependency 'rspec'
end
