require "bundler/gem_tasks"
class Rake::Task
  def overwrite(&block)
    @actions.clear
    enhance(&block)
  end
end

Rake::Task[:release].overwrite do
  p "This task is bypassed on purpose, to ensure we do not accidentally push the gem to Rubygems"
end

