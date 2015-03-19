require "extensions/views"

activate :views
activate :directory_indexes

set :relative_links, true
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :layout, 'layouts/application'

configure :development do
 activate :livereload

 activate :disqus do |d|
    d.shortname = "dev-nomadwiki"
  end
end

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets

  activate :disqus do |d|
    d.shortname = 'nomadwiki' # Replace with your Disqus shortname.
  end
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.branch = 'master'
end

helpers do
  def nav_link(link_text, page_url, options = {})
    options[:class] ||= ""
    if current_page.url.length > 1
      current_url = current_page.url.chop
    else
      current_url = current_page.url
    end
    options[:class] << " active" if page_url == current_url
    link_to(link_text, page_url, options)
  end
end
