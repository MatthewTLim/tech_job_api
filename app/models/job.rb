class Job < ApplicationRecord
  validates :company_name, presence: true, length: { maximum: 100 }
  validates :post_title, presence: true
  validates :job_category, presence: true
  validates :part_time_full_time, presence: true
  validates :location, presence: true, length: { maximum: 100 }
  validates :job_post_date, presence: true
  validates :apply_link, presence: true, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/, message: "must be a valid URL" }
  validates :details, length: { maximum: 1000 }, allow_blank: true
end