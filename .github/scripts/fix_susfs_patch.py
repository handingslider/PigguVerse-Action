#!/usr/bin/env python3
"""Drop the <trace/hooks/blk.h> context line from the SUSFS patch and fix hunk counts.

GKI's fs/namespace.c has that include, MTK/AOSP trees don't, so the hunk can't
match both. Removing a context line changes the hunk's line counts, which patch
then reports as a malformed hunk header.
"""
import re
import sys

path = sys.argv[1]
lines = open(path).readlines()
out = []
i = 0
while i < len(lines):
    line = lines[i]
    m = re.match(r"@@ -(\d+),(\d+) \+(\d+),(\d+) @@", line)
    if not m:
        out.append(line)
        i += 1
        continue
    j = i + 1
    body = []
    while j < len(lines) and not lines[j].startswith("@@ ") and not lines[j].startswith("diff --git "):
        body.append(lines[j])
        j += 1
    dropped = sum(1 for l in body if l.rstrip("\r\n") == " #include <trace/hooks/blk.h>")
    if dropped:
        body = [l for l in body if l.rstrip("\r\n") != " #include <trace/hooks/blk.h>"]
        line = "@@ -%s,%d +%s,%d @@%s" % (
            m.group(1), int(m.group(2)) - dropped,
            m.group(3), int(m.group(4)) - dropped,
            line[m.end():],
        )
    out.append(line)
    out.extend(body)
    i = j
open(path, "w").writelines(out)