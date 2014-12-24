module Ruboty
  module Fizzbuzz
    module Actions
      class Fizzbuzz < Ruboty::Actions::Base
        def call
          message.reply('dummy')
        end
      end
    end
  end
end
