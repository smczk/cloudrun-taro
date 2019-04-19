desc "Test"
task :test do
  project_id = `gcloud config get-value project`.strip
  system "docker build . --tag gcr.io/#{project_id}/app"
  system <<~CMD
    PORT=8080 && docker run --rm -p 8080:${PORT} -e PORT=${PORT} \
    gcr.io/#{project_id}/app ruby test/app_test.rb
  CMD
end

desc "Build"
task :build do
  system "gcloud beta builds submit --config cloudbuild.yaml"
end


desc "Deploy"
task :deploy do
  project_id = `gcloud config get-value project`.strip
  system "gcloud beta run deploy app --image gcr.io/#{project_id}/app --region us-central1"
end

desc "Destroy"
task :destroy do
  system "gcloud beta run services delete app --region us-central1"
end
