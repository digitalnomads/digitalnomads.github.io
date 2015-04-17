require "extensions/views"
require 'lib/wiki_helpers'

helpers WikiHelpers

activate :views
activate :directory_indexes

set :relative_links, true
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :layout, 'layouts/application'

page '/modal.html', :layout => false

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-61985635-1'
end

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
  def all_ids
    ids = []
    data.to_h.each_value {|t| ids << t.map {|v| WikiHelpers.generate_id(v[1]) }}
    ids.flatten
  end

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

all_ids.each do |id|
  proxy "/modal/#{id}.html", "/modal.html"
end