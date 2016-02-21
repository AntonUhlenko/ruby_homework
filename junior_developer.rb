require_relative 'developer'

class JuniorDeveloper < Developer

  MAX_TASKS = 5

  def add_task(task_name)
    raise(ArgumentError, 'Слишком сложно!') if task_name.length > 20
    super
  end

  def work!
    tasks_count_zero?
    puts "#{@name}: пытаюсь делать задачу \"#{ @task_list.shift }\". Осталось задач: #{ @task_list.length }"
  end
end
