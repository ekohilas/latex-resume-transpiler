import mistune
from sys import stdin
import md2tex

if __name__ == "__main__":

    renderer = md2tex.LatexRenderer()
    mistune.escape = md2tex.escape_latex
    markdown = mistune.Markdown(renderer=renderer, hard_wrap=True)

    PREAMBLE = r"""\documentclass{{two-column-resume}}
\usepackage[hidelinks]{{hyperref}}
\usepackage{{{}}}
"""

    HEADER = """\header
[{}]
{{{}}}
{{{}}}
{{{}}}
"""
    photo = "picture.jpg"

    title = "Name"

    subtitle = "Subtitle"

    details =  r"{}".format(
        renderer.autolink("name@email.com", is_email=True))

    print(PREAMBLE.format("two-column-resume"))
    print(r"\begin{document}")
    print(HEADER.format(photo, title, subtitle, details))
    print(markdown(stdin.read()))
    print(r"\end{document}")
