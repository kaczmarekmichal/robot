***Variables***
${message_variable}  message from variable section
${another_message_variable} another message from variable section


***Test Cases***
log to console builtin Test
  log to console    Hello, console!
my own login Test
  My own login  message from my own login
log to console using variable Test
  log to console  message_variable
message contain Test
    Should Contain  message_variable  message
message comparison Test
    Should Not Be Equal  message_variable  Hello, console!
message comparison from variable section Test
    Should Not Match  another_message_variable  message_variable


***Keywords***
My own login
   [Arguments]  ${my_messsage}
   log to console  ${my_messsage}
