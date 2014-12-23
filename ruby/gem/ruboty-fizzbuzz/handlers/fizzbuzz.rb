require "ruboty/fizzbuzz/actions/fizzbuzz"

module Ruboty
  module Handlers
    class Fizzbuzz < Base
      on /fizzbuzz (?<number>.*?)\z/, name: 'fizzbuzz', description: 'output fizzbuzz result'
    end
  end
end
