require 'rack/static'

use Rack::Static,
    :urls => ["/"],
    :root => "/srv/www",
    :cascade => true

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
    },
    File.open('/srv/www/index.html', File::RDONLY)
  ]
}
