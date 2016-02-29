class Developer

  MAX_TASKS = 10
  DEV_TYPE = :developer

  attr_reader :name, :task_num

  def initialize(name)
    @name = name
    @task_num = 0
    @task_list = []
  end

  def type
    self.class::DEV_TYPE
  end

  def max_tasks
    self.class::MAX_TASKS
  end

  def add_task(task_name)
    raise(ArgumentError, 'Слишком много работы!') if @task_list.length >= max_tasks
    @task_list << task_name
    puts "#{@name}: добавлена задача \"#{ task_name }\". Всего в списке задач: #{ @task_list.length }"
  end

  def tasks
    @task_list.each_with_index.map { |task, index| "#{index + 1}. #{task}" }.join("\n")
  end

  def tasks_count_zero?
    raise(ArgumentError, 'Нечего делать!') if @task_list.length.zero?
  end

  def work!
    tasks_count_zero?
    puts "#{@name}: выполнена задача \"#{ @task_list.shift }\". Осталось задач: #{ @task_list.length }"
  end

  def status
    case
      when @task_list.length.zero?
         'свободен'
      when @task_list.length.nonzero? && @task_list.length < max_tasks
         'работаю'
      else
         'занят'
    end
  end

  def can_add_task?
    @task_list.length < max_tasks
  end

  def can_work?
    @task_list.length.nonzero?
  end
end




