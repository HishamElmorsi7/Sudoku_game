class Tale
    attr_accessor :value
    attr_accessor :changable
    
    def initialize(value)
        @value = value
        
        if @value == "0"
            @changable = true
        else
            @changable = false
        end
    end
end