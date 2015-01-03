require 'sinatra'
require 'rack/cors'
require 'irkit'

use Rack::Cors do
  allow do
    origins '*'
    resource '/api/*', headers: :any, methods: :post
  end
end

not_found do
  'Not Found'
end

error 500 do
  'Error: ' + env['sinatra.error'].message
end

post '/api/:device/:commands' do
  device = params[:device]
  info   = IRKit::App::Data['Device'][device]
  irkit  = IRKit::InternetAPI.new(clientkey: info.clientkey, deviceid: info.deviceid)

  commands = params[:commands].split(',')
  commands.each.with_index(1) do |command, i|
    irdata = IRKit::App::Data['IR'][command]
    res = irkit.post_messages(irdata)
    case res.code
    when 200
      puts "Success: #{command} to #{device}"
    else
      raise res
    end

    sleep 1 if i < commands.size
  end
end
