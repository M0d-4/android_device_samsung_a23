#!/usr/bin/env python3
"""Shrink a gzip'd newc-cpio recovery ramdisk in place so Samsung's ABL accepts the image.

Drops the stock-recovery localized text PNGs (res/images/*_text.png, unused by the
TWRP/OrangeFox GUI, ~3 MB compressed) and swaps the 5 MB CJK fallback font for a
small valid TTF (keeps the filename so ui.xml references still resolve).
Usage: slim_ramdisk.py ramdisk-recovery.img
"""
import gzip, io, re, stat, sys

path = sys.argv[1]
raw = open(path, 'rb').read()
assert raw[:2] == b'\x1f\x8b', 'ramdisk is not gzip'
d = gzip.decompress(raw)

ents = []  # (name, header_bytes, data, mode)
o = 0
while True:
    assert d[o:o+6] == b'070701', 'not a newc cpio'
    f = [int(d[o+6+8*i:o+14+8*i], 16) for i in range(13)]
    mode, fs, nsz = f[1], f[6], f[11]
    name = d[o+110:o+110+nsz-1].decode()
    hdr_name = d[o:o+((110+nsz+3)&~3)]
    o2 = o + ((110+nsz+3)&~3)
    data = d[o2:o2+fs]
    o = (o2 + fs + 3) & ~3
    if name == 'TRAILER!!!':
        trailer = hdr_name + data
        break
    ents.append([name, hdr_name, data, mode])

small_font = next((e[2] for e in ents if e[0] == 'twres/fonts/Roboto-Regular.ttf'), None)
drop = re.compile(r'^res/images/.+_text\.png$')
out = io.BytesIO()
removed = replaced = 0
for name, hdr, data, mode in ents:
    if drop.match(name) and stat.S_ISREG(mode):
        removed += 1
        continue
    if name == 'twres/fonts/wqy-microhei.ttf' and small_font is not None and len(data) > len(small_font):
        hdr = bytearray(hdr)
        hdr[6+8*6:14+8*6] = b'%08X' % len(small_font)
        hdr = bytes(hdr)
        data = small_font
        replaced += 1
    out.write(hdr)
    out.write(data)
    out.write(b'\0' * (-len(data) % 4))
out.write(trailer)
body = out.getvalue()
body += b'\0' * (-len(body) % 512)
gz = gzip.compress(body, 9, mtime=0)
open(path, 'wb').write(gz)
print(f'slim_ramdisk: removed {removed} files, replaced {replaced} font; {len(raw)/1e6:.2f} MB -> {len(gz)/1e6:.2f} MB')
