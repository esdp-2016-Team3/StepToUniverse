module Levels
  class LanguageLevel
    attr_accessor :name, :result

    def initialize(name, result)
      @name = name
      @result = result
    end
  end
  
  class Beginner < LanguageLevel
  end

  class Elementary < LanguageLevel
  end

  class Intermediate < LanguageLevel
  end

  class UpperIntermediate < LanguageLevel
  end

  class EmptyLevel < LanguageLevel
  end

end