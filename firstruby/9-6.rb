
class CybernatedAndroid
    def initialize(name) @name = name end
end

proc = Proc.new {
    p self
    p @name
}

proc.call

dicey = CybernatedAndroid.new("dicey1")
dicey.instance_eval(&proc)


