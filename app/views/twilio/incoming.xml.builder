xml.instruct!
xml.Response do
    xml.Gather(:action => "handle-record.xml.builder", :numDigits => 1) do 
    xml.Say "Welcome to Voz Local. Please press 1 to leave a message."
    end
  end