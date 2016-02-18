require_relative 'developer'

class SeniorDeveloper < Developer

  MAX_TASKS = 15

  def max_tasks
    self.class::MAX_TASKS
  end

  def add_task(task_name)
    if @task_list.length >= max_tasks
      raise(ArgumentError, 'Слишком много работы!')
    else
      @task_num += 1
      @task_list << task_name
      puts "#{@name}: добавлена задача \"#{ task_name }\". Всего в списке задач: #{ @task_num }"
    end
  end

  def work!
    rand = Random.rand(2)
    raise(ArgumentError, 'Нечего делать!') if @task_list.length <= 0
    if rand == 0
      puts 'Что то лень'
    else
      puts "#{@name}: выполнены задачи \"#{ @task_list.shift }, #{ @task_list.shift }\". Осталось задач: #{ @task_list.length }"
    end
  end

  def can_add_task?
    @task_list.length < max_tasks
  end
end

