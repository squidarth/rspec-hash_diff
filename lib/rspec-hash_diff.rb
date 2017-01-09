require 'hashdiff'

module RSpec
  module Support
    class Differ
      def diff_as_object(actual, expected)
        if actual.instance_of?(Hash) && expected.instance_of?(Hash)
          diff = HashDiff.diff(actual, expected, delimiter: ":")
          diff_str = diff.map do |diff_line|
            key = diff_line[1].split(":")
            case diff_line[0]
            when "~"
              "+ " + key.map {|key| "{#{key}:" }.join("") + " #{diff_line[2]} #{key.length.times.map { "}" }.join("")}" + "\n" + "- " + key.map {|key| "{#{key}:" }.join("") + " #{diff_line[3]} #{key.length.times.map { "}" }.join("")}" + "\n"
            when "+"
              "+ " + key.map {|key| "{#{key}:" }.join("") + diff_line[2] + "\n"
            when "-"
              "- " + key.map {|key| "{#{key}:" }.join("") + diff_line[3] + "\n"
            end
          end.join("")
          diff_str = "\n#{diff_str}"
        else
          actual_as_string = object_to_string(actual)
          expected_as_string = object_to_string(expected)
          diff_as_string(actual_as_string, expected_as_string)
        end
      end
    end
  end
end
