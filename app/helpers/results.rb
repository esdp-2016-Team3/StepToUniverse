module Results
  include Levels
  
  class Result
    MINIMUM = 2
    MAXIMUM_CORRECT_ANSWERS = 5
    EMPTY_LEVEL = Levels::EmptyLevel.new('EmptyLevel', 0)

    def define(array_levels)
      $levels = array_levels
      $levels.each do |level|
        if (( level_has_minimum_correct_answers(level) and !level_all_correct(level) and all_previous_are_correct(level)) or
            ( level_has_minimum_correct_answers(level) and !level_has_minimum_correct_answers(GetNextLevel(level)) and !step_and_next_all_correct(level) and all_previous_are_correct(level)) or
            ( !level_has_minimum_correct_answers(level) and !all_others_are_currect(level) and level.eql?(get_beginner_level())) or
            ( !level_all_correct(level) and all_others_are_currect(level) and !level.eql?(get_the_last_level()) and all_previous_are_correct(level)) or
            ( !level_has_minimum_correct_answers(GetNextLevel(level)) and !step_and_next_all_correct(level) and all_others_are_currect(level) and !level.eql?(get_the_last_level()) and all_previous_are_correct(level)))
          return level.name
        end
      end
        return 'Произошла техническая ошибка'
    end        

    private

    def all_others_are_currect(level)
      sum = 0
      for i in $levels
        if i == level
          next
        end
          sum += level.result
      end
      return sum == MAXIMUM_CORRECT_ANSWERS * $levels.count
    end

    def get_beginner_level()
      return $levels.first
    end

    def get_the_last_level()
      return $levels.last
    end
          
    def GetNextLevel(level)
      index = $levels.index(level)
      if index + 1 >= $levels.length
        return EMPTY_LEVEL
      else
        return $levels[index + 1]
      end
    end

    def level_all_correct(level)
      return level.result >= MAXIMUM_CORRECT_ANSWERS
    end

    def level_has_minimum_correct_answers(level)     
      return level.result >= MINIMUM
    end

    def all_previous_are_correct(level)
      index = $levels.index(level)
      sum = 0
      counter = 0    
      for i in index...0 do
        sum += $levels[i].result
        counter += 1
      end
      return sum == MAXIMUM_CORRECT_ANSWERS * counter
    end

    def step_and_next_all_correct(level)
      index = $levels.index(level)
      if(index + 2 < $levels.length)
        sum = ($levels[index + 2].result)
        counter = 1
        len = $levels.length - 1
        for i in index + 2..len do
          sum += $levels[i].result
          counter += 1
        end
        return sum == MAXIMUM_CORRECT_ANSWERS * counter
      else
        return false
      end
    end
  end
end