namespace :render do
  desc "Run migrations, seed database, then start Puma for Render"
  task :migrate_and_start => :environment do
    puts "== Running migrations =="
    Rake::Task["db:migrate"].invoke

    puts "== Seeding database (ensuring default user exists) =="
    Rake::Task["db:seed"].invoke

    puts "== Starting Puma =="
    # Usa la config/puma.rb si existe, sino se arranca simple
    exec "bundle exec puma -C config/puma.rb"
  end
end
