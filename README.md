# RSpec Hash Diff

RSpec Hash Diff is a library that makes Hash comparisons in RSpec much easier to read.

For hashes that are deeply nested, it can be hard to visually parse what the actual error was:

```
  1) Hello does some stuff
     Failure/Error: expect({a: "hello", b: "goodbye", c: { d: "movei", e: "another", f: { g: 'a word' } }}).to match({ a: "hello", b: 3, c: { d: "movei", e: "another", f: { g: "diff word" }}})

       expected {:a=>"hello", :b=>"goodbye", :c=>{:d=>"movei", :e=>"another", :f=>{:g=>"a word"}}} to match {:a=>"hello", :b=>3, :c=>{:d=>"movei", :e=>"another", :f=>{:g=>"diff word"}}}
       Diff:
       @@ -1,4 +1,4 @@
        :a => "hello",
       -:b => 3,
       -:c => {:d=>"movei", :e=>"another", :f=>{:g=>"diff word"}},
       +:b => "goodbye",
       +:c => {:d=>"movei", :e=>"another", :f=>{:g=>"a word"}},
     # ./test.rb:8:in `block (2 levels) in <top (required)>'
```

With `rspec-hash-diff` included, we show the keys inside the deeply nested hash that were actually different:

```
  1) Hello does some stuff
     Failure/Error: expect({a: "hello", b: "goodbye", c: { d: "movei", e: "another", f: { g: 'a word' } }}).to match({ a: "hello", b: 3, c: { d: "movei", e: "another", f: { g: "diff word" }}})

       expected {:a=>"hello", :b=>"goodbye", :c=>{:d=>"movei", :e=>"another", :f=>{:g=>"a word"}}} to match {:a=>"hello", :b=>3, :c=>{:d=>"movei", :e=>"another", :f=>{:g=>"diff word"}}}
       Diff:
       + {b: goodbye }
       - {b: 3 }
       + {c:{f:{g: a word }}}
       - {c:{f:{g: diff word }}}
     # ./test.rb:8:in `block (2 levels) in <top (required)>'

Finished in 0.00665 seconds (files took 0.67129 seconds to load)
1 example, 1 failure
```

This nested diff is computed using [hashdiff](https://github.com/liufengyun/hashdiff).


### Installation & Usage

Available on RubyGems:

`gem install rspec-hash_diff`

Simply call `require 'rspec-hash_diff' in a `spec_helper.rb` file (or any spec files where you want this to run).

### Thanks

This rspec library only exists because of @liufengyun's awesome [hashdiff](https://github.com/liufengyun/hashdiff) library. Thank you!



