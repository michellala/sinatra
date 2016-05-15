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


#below is from question 7: we want to add an action that allows us to respond to a url like /message/2 instead of defining an action for each potential message ID. By doing the below, we are defining one action that will accept ANY id in the url. After doing this is when we implemented the show.erb file; the :id part tells sinatra to amtch anything and give it pack to us as a "param". Since the :id is the record ID of the msg, we can use active record's 'find' method to grab it from the DB for us! 
get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end 

post '/messages' do
  @message= Message.new(
    title: params[:title],
    content: params[:content],
    author: params[:author]
    )


#we need to make sure that we aren'ts saving a message if all fields are left blank. So we need to validate it with Acitve Record. We will put the validation in the models/messages/message.rb file  
#Question 9: No extra code was added below, but we added in code for the new.rb file to say that if @message had any errors to redirect them to a page that says that there was something wrong with their message entry attempt
  if @message.save
  redirect '/messages'
  else
    erb :'messages/new'
  end

end















