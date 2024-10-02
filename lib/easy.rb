# easy.rb
# static html pages generator

require 'erb'
require 'fileutils'
require 'redcarpet'

class Easy
  attr_reader :site, :list_of_posts
  attr_reader :index, :template
  attr_reader :year

  def initialize(site)
    @site = site
    @list_of_posts = []
    @template = File.read('templates/page.erb')
    @index = File.read('templates/index.erb')
    @year = Time.now.year.to_s
#    FileUtils.mkdir @site
#    FileUtils.mkdir @site +'/pages'
#    FileUtils.mkdir @site +'/posts'
#    FileUtils.cp_r('css', @site)
#    FileUtils.cp_r('images', @site)
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
    FileUtils.mkdir @site +'/pages'
    # builds home page
    content = ''
    html_list = Dir['pages/*.html'].sort
    html_list.each { |page|
      page_name = File.basename(page, '.html')
      content << ' <div class="trigger"><a class="page-link" href="/pages/' + page_name + '.html">' + page_name + "</a></div>\n"
    }
    md_list = Dir['pages/*.md'].sort
    md_list.each { |page|
      page_name = File.basename(page, '.md')
      content << ' <div class="trigger"><a class="page-link" href="/pages/' + page_name + '.html">' + page_name + "</a></div>\n"
    }
    process_page('pages', 'Pages', content)

    # builds each html page
    html_list.each { |page|
      title = File.basename(page, '.html')
      content = File.read(page)
      process_page('pages/'+title, title, content)
    }

    # builds each md page
    md_list.each { |page|
      title = File.basename(page, '.md')
      content = markdown_to_html(File.read(page))
      process_page('pages/'+title, title, content)
    }
  end 

  def process_posts
    FileUtils.mkdir @site +'/posts'
    list = Dir['posts/*.md'].reverse
    list.each { |post|
      post_name = File.basename(post, '.md')
      title = post_name.sub('_', ' ')
      ref = '"/posts/' + post_name + '.html">' + title
      @list_of_posts.push(ref)
    
      content = markdown_to_html(File.read(post))
      process_page('posts/'+post_name, title, content)
    }
  end 

end
