class AddDetailsToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :details, :string
  end
end
