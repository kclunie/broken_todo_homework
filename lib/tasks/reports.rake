namespace :todo do
  namespace :reports do
    desc 'Generate a CSV report of completed Items'
    task :csv => :environment do
      CompletedItemsCsvExporter.new.export!
    end
  end
end
