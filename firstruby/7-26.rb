class SleepyPerson
    @event_handle = nil
    def register_handler(&handler)
        @event_handle = handler
    end
    def wake_up
        @event_hadle.call Time.now, "wake up"
    end
end

john = SleepyPerson.new
john.register_handler{|time, message| p [time, message]}
john.wake_up

