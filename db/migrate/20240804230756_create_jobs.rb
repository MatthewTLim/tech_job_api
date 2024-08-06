class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :post_title
      t.string :job_category
      t.string :part_time_full_time
      t.string :location
      t.string :job_post_date
      t.string :apply_link

      t.timestamps
    end
  end
end
