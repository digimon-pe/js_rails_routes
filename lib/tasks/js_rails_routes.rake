desc 'Generate a ES6 module that contains Rails routes'
namespace :js do
  task routes: :environment do |task|
    generator = JSRailsRoutes::Generator.instance
    generator.include_paths = Regexp.new(ENV['include_paths']) if ENV['include_paths']
    generator.exclude_paths = Regexp.new(ENV['exclude_paths']) if ENV['exclude_paths']
    generator.include_names = Regexp.new(ENV['include_names']) if ENV['include_names']
    generator.exclude_names = Regexp.new(ENV['exclude_names']) if ENV['exclude_names']
    generator.base_path = ENV['base_path'] if ENV['base_path']
    generator.generate(task)
    puts "Routes saved into #{generator.base_path}."
  end
end
