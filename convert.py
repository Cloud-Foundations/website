from sys import argv
import re
import os

def svgreplace(match):
    "replace match with the content of a filename match"
    filename = match.group(1)
    with open(filename) as f:
        return f.read()

def svgfy(string):
    img = re.compile(r'<img src="([^"]*\.svg)"[^>]*>')
    return img.sub(svgreplace, string)

if __name__ == "__main__":
    fname = argv[1]
    with open(fname) as f:
        html = f.read()
        out_fname = fname + ".tmp"
        out = open(out_fname, 'w')
        out.write(svgfy(html))
        out.close()
        os.rename(out_fname, fname)
