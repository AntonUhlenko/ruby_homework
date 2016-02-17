class Developer

  MAX_TASKS = 10

  def initialize(name)
    @name = name
    @task_num = 0
    @task_list = []
  end

  def add_task(task_name)
    if @task_list.length >= MAX_TASKS
      raise(ArgumentError, 'Слишком много работы!')
    else
      @task_num += 1
      @task_list << task_name
      puts "#{@name}: добавлена задача \"#{task_name}\". Всего в списке задач: #{@task_num}"
    end
  end

  def tasks
    @task_list.each { |elem| puts "#{@task_list.index(elem) + 1}. #{elem}" }
  end

  def work!
    if @task_list.length <= 0
      raise(ArgumentError, 'Нечего делать!')
    else
      puts "#{@name}: выполнена задача \"#{@task_list.delete_at(0)}\". Осталось задач: #{@task_list.length}"
    end
  end

  def status
    case
      when @task_list.length == 0
        p 'свободен'
      when @task_list.length > 0 && @task_list.length <= 9
        p 'работаю'
      else
        p 'занят'
    end
  end

  def can_add_task?
    @task_list.length < MAX_TASKS ? true : false
  end

  def can_work?
    @task_list.length == 0 ? false : true
  end
end


