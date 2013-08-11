class SendTextController < ApplicationController
  def index
  end
 
  def send_text_message
    number_to_send_to = params[:number_to_send_to]
 
    twilio_sid = "AC1e0a4be29115c7f8fc7bfc22e7a8a551"
    twilio_token = "efae2203cfdc5d8e4aafc6ddd7838a43"
    twilio_phone_number = "2024369431"
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "This is an message. It gets sent to #{number_to_send_to}"
    )
  end
end