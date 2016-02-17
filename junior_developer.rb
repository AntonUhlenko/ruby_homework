require_relative 'developer'

class JuniorDeveloper < Developer

  MAX_TASKS = 5

  def max_tasks
    self.class::MAX_TASKS
  end

  def add_task(task_name)
    if task_name.length > 20
      puts 'Слишком сложно!'
    else
      if @task_list.length >= max_tasks
        raise(ArgumentError, 'Слишком много работы!')
      else
        @task_num += 1
        @task_list << task_name
        puts "#{@name}: добавлена задача \"#{task_name}\". Всего в списке задач: #{@task_num}"
      end
    end
  end

  def work!
    if @task_list.length <= 0
      raise(ArgumentError, 'Нечего делать!')
    else
      puts "#{@name}: пытаюсь делать задачу \"#{@task_list.delete_at(0)}\". Осталось задач: #{@task_list.length}"
    end
  end

  def can_add_task?
    @task_list.length < max_tasks ? true : false
  end
end
