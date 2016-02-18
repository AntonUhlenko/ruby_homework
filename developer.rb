class Developer

  MAX_TASKS = 10

  def initialize(name)
    @name = name
    @task_num = 0
    @task_list = []
  end

  def add_task(task_name)
    raise(ArgumentError, 'Слишком много работы!') if @task_list.length >= MAX_TASKS
    @task_num += 1
    @task_list << task_name
    puts "#{@name}: добавлена задача \"#{ task_name }\". Всего в списке задач: #{ @task_num }"
  end

  def tasks
    @task_list.each_with_index { |elem, index| "#{index += 1 }. #{ elem }" }
  end

  def work!
    raise(ArgumentError, 'Нечего делать!') if @task_list.length <= 0
    puts "#{@name}: выполнена задача \"#{ @task_list.shift }\". Осталось задач: #{ @task_list.length }"
  end

  def status
    case
      when @task_list.length == 0
         'свободен'
      when @task_list.length > 0 && @task_list.length <= 9
         'работаю'
      else
         'занят'
    end
  end

  def can_add_task?
    @task_list.length < MAX_TASKS
  end

  def can_work?
    @task_list.length == 0
  end
end




