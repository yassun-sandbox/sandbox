class JsonTransferService
  class << self

    def execute(user1, user2)
      hoge(user1)
      fuga(user2)
      { hoge:user1, fuga:user2 }
    end

    private

    def hoge(user)
      user["type"] = "HOGE"
    end

    def fuga(user)
      user["type"] = "FUGA"
    end

  end
end

