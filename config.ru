require 'rack/static'

use Rack::Static,
    :urls => ["/"],
    :root => "./www",
    :cascade => true

run lambda { |env|
  [
    200,
    {
      'content-type'  => 'text/html',
    },
    File.open('./www/blog.html', File::RDONLY)
  ]
}
