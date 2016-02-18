require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'

dev = Developer.new('Thomas')
i = 0
10.times { i += 1; dev.add_task("task_#{i}") }

dev.can_add_task?
dev.tasks
dev.status
dev.can_work?
dev.work!


dev_j = JuniorDeveloper.new('Jason')
j = 0
5.times { j += 1; dev_j.add_task("task_#{j}") }
dev_j.can_add_task?
dev_j.can_work?
dev_j.status
dev_j.tasks


dev_s = SeniorDeveloper.new('ZeroCool')
s = 0
15.times { s += 1; dev_s.add_task("task_#{s}") }
dev_s.status
dev_s.tasks
dev_s.can_work?
6.times { dev_s.work! }