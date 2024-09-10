FactoryBot.define do
  factory :job do
    company_name { Faker::Company.name }
    post_title { Faker::Job.title }
    job_category { Faker::Job.field }
    part_time_full_time { ["Part-time", "Full-time"].sample }
    location { Faker::Address.city }
    job_post_date { Faker::Date.backward(days: 14).strftime("%Y-%m-%d") }
    apply_link { Faker::Internet.url(host: 'example.com', path: '/apply') }
    details { Faker::Job.key_skill + " is required for this position." }
  end
end
