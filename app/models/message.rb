class Message < ActiveRecord::Base
  attr_accessible :from_number, :message_body
end
