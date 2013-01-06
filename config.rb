HandlebarsAssets::Config.ember = true
HandlebarsAssets::Config.path_prefix = "app/templates"

activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

page "/error.html", layout: "error"

configure :build do
  ignore "stylesheets/app/*"
  ignore "javascripts/vendor/*"
  ignore "javascripts/app/*"

  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :sync do |sync|
  sync.fog_provider          = 'AWS'
  sync.fog_directory         = 'gtgarchive.com'
  sync.aws_access_key_id     = ENV.fetch("S3_KEY")
  sync.aws_secret_access_key = ENV.fetch("S3_SEC")
  sync.existing_remote_files = 'keep'
end
