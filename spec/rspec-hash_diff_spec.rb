require 'rspec'
require 'rspec/support/spec/string_matcher'
require 'rspec-hash_diff'

RSpec.describe 'RspecHashDiff' do
  let(:differ) { RSpec::Support::Differ.new }

  it 'returns the correct diff' do
    expected_diff = <<-'EOD'
\+ {b: goodbye }
\- {b: 3 }
\+ {c:{f:{g: a word }}}
\- {c:{f:{g: diff word }}}
    EOD
    actual = {a: "hello", b: "goodbye", c: { d: "movei", e: "another", f: { g: 'a word' } }}
    expected = { a: "hello", b: 3, c: { d: "movei", e: "another", f: { g: "diff word" }}}
    diff = differ.diff(actual, expected)
    expect(diff).to match(expected_diff)
  end
end
