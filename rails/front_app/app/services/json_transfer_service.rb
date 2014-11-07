class JsonTransferService
  class << self

    def execute(json)
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

