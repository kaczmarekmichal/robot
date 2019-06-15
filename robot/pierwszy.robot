***Test Cases***
log to console builtin Test
  log to console    Hello, console!
my own login Test
  My own login  message from my own login
log to console using variable Test
  log to console  message_variable


***Keywords***
My own login
   [Arguments]  ${my_messsage}
   log to console  ${my_messsage}

***Variables***
 ${message_variable}  message from variable section
