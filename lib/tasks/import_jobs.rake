namespace :import do
  desc "Import jobs from CSV"
  task jobs: :environment do
    require 'csv'

    csv_file_path = Rails.root.join('../../Job_Board/Web_Scraper_v1/Silicone_forest_listing.csv')

    CSV.foreach(csv_file_path, headers: true) do |row|
      job = Job.new(row.to_hash)

      if job.save
        puts "Job #{job.post_title} was successfully imported."
      else
        puts "Failed to import job: #{row['title']}"
        puts job.errors.full_messages.join(", ")
      end
    end
  end
end