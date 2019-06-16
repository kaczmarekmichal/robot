#!/user/bin/python

import paramiko

ssh_client =paramiko.SSHClient()
string_pattern = "Linux tester"

ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh_client.connect("localhost",username="tester",password="tester")
a,b,c = ssh_client.exec_command("uname -a")

log= b.read()
if string_pattern in log:
    print "zawiera Linux tester"
else:
    print "nie zawiera Linux tester"
