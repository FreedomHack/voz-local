class TwilioController < ApplicationController  
BASE_URL = "http://voz-local.britneywright.c9.io/twilio"         
 
  def message 
    @message_body = params["Body"]
    @from_number = params["From"]
    
    m = Message.new
    m.message_body = @message_body
    m.from_number = @from_number
    m.save

    render 'process_sms.xml.erb', :content_type => 'text/xml'
  end
  
  def incoming          
      render :action => "incoming.xml.builder", :layout => false
        
    # 1 to leave a message.     
    if params['Digits'] == '1'       
      render :action => "handle-record.xml.builder", :layout => false
    elsif params['Digits'] == '4'
      @goodbye_message = "Have a great day."
      render :action => "goodbye.xml.builder", :layout => false
    end
  end
  
end