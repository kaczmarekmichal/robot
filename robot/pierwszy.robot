***Settings***
Library    SSHLibrary

***Variables***
${message_variable}  message from variable section
${another_message_variable}  another message from variable section
${Remote_host}  127.0.0.1
${User_name}  tester
${User_password}  tester


***Test Cases***
log to console builtin Test
  log to console    Hello, console!
my own login Test
  My own login  message from my own login
log to console using variable Test
  log to console  ${message_variable}
message contain Test
    Should Contain  ${message_variable}  message
message comparison Test
    Should Not Be Equal  ${message_variable}  Hello, console!
message comparison from variable section Test
    Should Not Match  ${another_message_variable}  ${message_variable}
connect to remote computer ssh Test
      Open Connection  ${Remote_host}
      Login   ${User_name}   ${User_password}
      Close All Connections


***Keywords***
My own login
   [Arguments]  ${my_messsage}
   log to console  ${my_messsage}
