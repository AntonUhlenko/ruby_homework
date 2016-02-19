require_relative 'developer'

class SeniorDeveloper < Developer

  MAX_TASKS = 15

  def work!
    Random.rand(2) == 0 ? puts('Что то лень') : 2.times { super }
  end
end

