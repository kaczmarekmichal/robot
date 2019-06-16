***Settings***
Library    SSHLibrary
Library    dodatkowy_plik_pythonowy.py
Library    SeleniumLibrary

***Variables***
${message_variable}  message from variable section
${another_message_variable}  another message from variable section
${Remote_host}  127.0.0.1
${User_name}  tester
${User_password}  tester
${BROWSER}   Firefox
${MAIN_PAGE}  http://poczta.wp.pl
${WP_USER}  testerwsb_t1
${WP_PASSWORD}  adam1234
${LOGIN_FIELD}  //*[@id="login"]
${PASSWORD_FIELD}  //*[@id="password"]
${SUBMIT_BUTTON}  //*[@id="btnSubmit"]


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

connect to remote computer ssh - internet connection - correct ip Test
      Open Connection  ${Remote_host}
      Login   ${User_name}   ${User_password}
      ${response} =  Execute Command  ping -c1 8.8.8.8
      Should Contain  ${response}  1 received
      Close All Connections

connect to remote computer ssh - internet connection -incorrect ip Test
      Open Connection  ${Remote_host}
      Login   ${User_name}   ${User_password}
      ${response} =  Execute Command  ping -c1 8.8.8.9
      Should Contain  ${response}  0 received
      Close All Connections

connect to remote computer ssh -user name Test
        Open Connection  ${Remote_host}
        Login   ${User_name}   ${User_password}
        ${response} =  Execute Command  uname -a
        Should Contain  ${response}  Linux tester
        Close All ConnectionsCapture Page Screenshot

connect to remote computer ssh -number of CPU Test
      Open Connection  ${Remote_host}
      Login   ${User_name}   ${User_password}
      ${response} =  Execute Command  nproc --all
      Should Be Equal  ${response}  4
      Close All Connections

connect to remote computer ssh -number of CPU using grep Test
      Open Connection  ${Remote_host}
      Login   ${User_name}   ${User_password}
      ${response} =  Execute Command  cat /proc/cpuinfo | grep -wc processor
      Should Be Equal  ${response}  4
      Close All Connections

external python library Test
      ${response} =   print_hello_world
      Should Be Equal   ${response}   Hello world

external python library 2nd Test
      ${response} =   print_hello
      Should Be Equal   ${response}   Wiadomosc powitalna

log into wp mail Test
    Open Browser  ${MAIN_PAGE}   ${BROWSER}
    Input Text  ${LOGIN_FIELD}   ${WP_USER}
    Input Password   ${PASSWORD_FIELD}    ${WP_PASSWORD}
    Click Element   ${SUBMIT_BUTTON}
    Page Should Contain  Odebrane
    Capture Page Screenshot
    Close Browser






***Keywords***
My own login
   [Arguments]  ${my_messsage}
   log to console  ${my_messsage}
