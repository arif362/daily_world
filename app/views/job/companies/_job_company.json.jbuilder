json.extract! job_company, :id, :title, :description, :email, :address, :created_at, :updated_at
json.url job_company_url(job_company, format: :json)
