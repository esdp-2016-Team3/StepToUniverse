module Levels
  class Level
    attr_accessor :name, :result

    def initialize(name, result)
      @name = name
      @result = result
    end
  end
  
  class Beginner < Level
  end

  class Elementary < Level
  end

  class Intermediate < Level
  end

  class UpperIntermediate < Level
  end

  class EmptyLevel < Level
  end

end