class Message < ActiveRecord::Base

#below we need to validate that the user doesn't leave the fields blank. In the actions.rb file, it is checking to see if the messages (once saved with @message.save) have the parameters that were outlined in the message.new 
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 40}
  validates :author, presence: true, length: { maximum: 25}

end