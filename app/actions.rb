#MICHELLE: any time a comment is put above a line of code it is explaining what it is there for (not below)

# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  #our server needs to load the messages from the database, render them as HTML, and send that HTML back as a response to their browser. @messages allows us to load all the messages before rendering the HTML
  @messages = Message.all
  erb :'messages/index'

end

get '/messages/new' do
  erb :'messages/new'
end


