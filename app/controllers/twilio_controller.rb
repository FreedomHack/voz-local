class TwilioController < ApplicationController
  def message 
    @message_body = params["Body"]
    @from_number = params["From"]
 
    render 'process_sms.xml.erb', :content_type => 'text/xml'
  end
end