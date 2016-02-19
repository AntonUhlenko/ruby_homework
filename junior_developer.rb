require_relative 'developer'

class JuniorDeveloper < Developer

  MAX_TASKS = 5

  def add_task(task_name)
    raise(ArgumentError, 'Слишком сложно!') if task_name.length > 20
    raise(ArgumentError, 'Слишком много работы!') if @task_list.length >= max_tasks
    @task_num += 1
    @task_list << task_name
    puts "#{@name}: добавлена задача \"#{ task_name }\". Всего в списке задач: #{ @task_num }"
  end

  def work!
    tasks_count_zero?
    puts "#{@name}: пытаюсь делать задачу \"#{ @task_list.shift }\". Осталось задач: #{ @task_list.length }"
  end
end
