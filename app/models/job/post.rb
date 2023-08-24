class Job::Post < ApplicationRecord
  belongs_to :company, class_name: 'Job::Company', foreign_key: :job_company_id
end
