require 'bundler'
Bundler.require

desc "Build application.js"
task :opal do
  # Build application.js
  Opal.append_path "app/web"
  Opal.append_path "app/web/javascript"
  File.binwrite "application.js", Opal::Builder.build("application").to_s
  # Build application.css
  sh "bundle exec sass -I app/web/css app/web/css/application.css.scss application.css"
end
