class JsonTransferService
  class << self

    def execute
      hoge
      huga
    end

    private

    def hoge
      puts "hugahuga"
    end

    def huga
      puts "hugahuga"
    end
  end
end

