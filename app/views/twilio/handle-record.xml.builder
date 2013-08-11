xml.instruct!
xml.Response do
    xml.Say "Record your message."
    xml.Record :maxLength => "30", :action => "/record", :method => "get"
    xml.Say "Press any other key to start over."
  end
end