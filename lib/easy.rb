# easy.rb
# static html pages generator

require 'erb'
require 'fileutils'
require 'redcarpet'

class Easy
  attr_reader :site
  attr_reader :list_of_pages, :list_of_posts
  attr_reader :index, :template
  attr_reader :backtracking
  attr_reader :brand_name
  attr_reader :brand_title
  attr_reader :copyright

  def initialize(site)
    @site = site
    @list_of_pages = []
    @list_of_posts = []
    @template = File.read('templates/page.erb')
    @index = File.read('templates/index.erb')
    @backtracking  = "/#pages"
    @brand_name    = "PB"
    @brand_title   = "Easy blog"
    @copyright     = "&#169;" + Time.now.year.to_s + " | Developed by Pierre Bazonnard | Designed by Puskar Adhikari | All rights reserved."
  end

  def process
    FileUtils.cp_r('assets', @site)
    process_templates
    process_pages
    process_posts
    process_index
  end

  private

  def write(name, text)
    fh = open(@site+'/'+name+'.html', 'w')
    fh.puts text
    fh.close
  end

  def markdown_to_html(text)
    renderer = Redcarpet::Render::HTML.new
    parser =Redcarpet::Markdown.new(renderer)
    parser.render(text)
  end

  def process_page(name, title, content)
    renderer = ERB.new(@template)
    write(name, renderer.result(binding))
  end

  def process_index
    renderer = ERB.new(@index)
    write('index', renderer.result(binding))
  end

  def process_templates
    # process every md files in templates dir
    list = Dir['templates/*.md']
    list.each { |page|
      title = File.basename(page, '.md')
      content = markdown_to_html(File.read(page))
      process_page(title, title, content)
    }
  end 

  def process_pages
    @backtracking = "/#pages"
    FileUtils.mkdir @site +'/pages'

    # builds each html page
    html_list = Dir['pages/*.html']
    html_list.each { |page|
      name = File.basename(page, '.html')
      title = name.gsub('_', ' ')
      ref = '"/pages/' + name + '.html">' + title
      @list_of_pages.push(ref)

      content = File.read(page)
      process_page('pages/'+name, title, content)
    }

    # builds each md page
    md_list = Dir['pages/*.md'].sort
    md_list.each { |page|
      name = File.basename(page, '.md')
      title = name.gsub('_', ' ')
      ref = '"/pages/' + name + '.html">' + title
      @list_of_pages.push(ref)
    
      content = markdown_to_html(File.read(page))
      process_page('pages/'+name, title, content)
    }
    # Sorts the list
    @list_of_pages.sort!
  end 

  def process_posts
    @backtracking = "/#blog"
    FileUtils.mkdir @site +'/posts'
    list = Dir['posts/*.md'].reverse
    list.each { |post|
      post_name = File.basename(post, '.md')
      title = post_name.gsub('_', ' ')
      ref = '"/posts/' + post_name + '.html">' + title
      @list_of_posts.push(ref)
    
      content = markdown_to_html(File.read(post))
      process_page('posts/'+post_name, title, content)
    }
  end 

end
