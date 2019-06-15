***Test Cases***
log to console bulitin Test
  log to console    Hello, console!
my own login Test
  My own login  message from my own login


***Keywords***
My own login
   [Arguments]  ${my_messsage}
   log to console  ${my_messsage}
