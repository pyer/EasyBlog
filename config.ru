require 'rack/static'

use Rack::Static,
    :urls => ["/"],
    :root => "./www",
    :cascade => true

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
    },
    File.open('./www/index.html', File::RDONLY)
  ]
}
