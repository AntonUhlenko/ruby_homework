require_relative 'developer'
require_relative 'senior_developer'
require_relative 'junior_developer'
require 'pp'
require 'pry'

class Team

  def initialize(&block)
    @team = {}
    @messages = {}
    @priority = []
    instance_eval &block
  end

  def seniors
    @team[:seniors]
  end

  def developers
   @team[:developers]
  end

  def juniors
    @team[:juniors]
  end

  def all
    @team.values.flatten
  end

  def priority(*list)
    @priority = list
  end

  def have_seniors(*names)
    @team[:seniors] = names.map { |name| SeniorDeveloper.new(name) }
  end

  def have_developers(*names)
    @team[:developers] = names.map { |name| Developer.new(name) }
  end

  def have_juniors(*names)
    @team[:juniors] = names.map { |name| JuniorDeveloper.new(name) }
  end

  def on_task(type, &block)
    @messages[type] = block if block_given?
  end

  def add_task(task)
    @priority.each do |priority|
      unit = @team[priority].sort_by { |developer| developer.tasks.size }.first
      if
      unit.task_num < unit.max_tasks
        unit.add_task(task)
        @messages[unit.type].call(unit, task)
        break
      end
    end
  end

  def report
    @priority.each do |priority|
      @team[priority].each { |dev| puts "#{dev.name} (#{dev.type}): #{dev.tasks.join(', ')}."}
    end
  end
end


team = Team.new do
  have_juniors 'Петя', 'Дима'
  have_developers 'Олег', 'Ира'
  have_seniors 'Дима', 'Маша'
  priority :juniors, :developers, :seniors

  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  end

  on_task :developer do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}!"
  end

  on_task :senior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, не приставайте ко мне!"
  end
end

binding.pry
