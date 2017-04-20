import mistune
from sys import stdin

class LatexRenderer(mistune.Renderer):
    def header(self, text, level, raw):
        if level == 1:
            return "\\section{{{}}}\n\\begin{{eventlist}}\n".format(text)
        if level == 2:
            return "\\section{{{}}}\n".format(text)
        if level == 3:
            return "\n\item\n{{{}}}%\n".format(text)
        if 4 <= level <= 6:
            return "{{{}}}%\n".format(text)

    def paragraph(self, text):
        return "{{{}}}%\n".format(text)

    def hrule(self):
        return "\n\\end{eventlist}\n\n"

    def list(self, body, ordered):
        return "\\begin{{skilllist}}\n\n{}\n\\end{{skilllist}}\n".format(body)

    def list_item(self, text):
        return "\\item{{{}}}{{{}}}%\n".format(*map(str.strip, text.split("|", 1)))

    def linebreak(self):
        return "\\\\%\n"

    def link(self, link, title, content):
        return "\\href{{{}}}{{{}}}".format(escape_latex(link), content)

    def autolink(self, link, is_email=False):
        if is_email:
            return self.link("mailto:"+link, "", link)
        else:
            return self.link(link, "", escape_latex(link.replace("https://", "", 1).replace("http://", "", 1)))

    def strikethrough(self, text):
        return ""

    def codespan(self, code):
        return "{}\n".format(code)

    def block_code(self, code, language=None):
        return "{}\n".format(code)

def escape_latex(text, smart_amp=False):
    reserved = {
            "#":  r"\#",
            "$":  r"\$",
            "%":  r"\%",
            "^":  r"\textasciiciicircum ",
            "&":  r"\&",
            "_":  r"\_",
            "{":  r"\{",
            "}":  r"\}",
            "~":  r"\textasciitilde ",
            "\\": r"\\"
            }
    return str.translate(text, str.maketrans(reserved))

if __name__ == "__main__":
    renderer = LatexRenderer()
    mistune.escape = escape_latex
    markdown = mistune.Markdown(renderer=renderer, hard_wrap=True)
    print(markdown(stdin.read()))

