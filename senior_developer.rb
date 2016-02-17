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
      puts "#{@name}: добавлена задача \"#{task_name}\". Всего в списке задач: #{@task_num}"
    end
  end

  def work!
    rand = Random.rand(2)
    if @task_list.length <= 0
      raise(ArgumentError, 'Нечего делать!')
    else
       if rand == 0
          p 'Что то лень'
        else
          puts "#{@name}: выполнены задачи \"#{@task_list.delete_at(0)}, #{@task_list.delete_at(0)}\". Осталось задач: #{@task_list.length}"
      end
    end
  end

  def can_add_task?
    @task_list.length < max_tasks ? true : false
  end
end

