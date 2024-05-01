use Mojolicious::Lite;

get '/hello' => {text => 'Hello'};

app->start;

__END__

mojo daemon --listen http://*:3001
