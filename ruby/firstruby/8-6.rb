class Duration
    def initialize(since, till)
        @since = since
        @untill = till
    end
    attr_accessor :since, :untill
end

duration = Duration.new(Time.now, Time.now + 3600)
p duration.untill
p duration.since = Time.now

