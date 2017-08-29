# latex-resume-transpiler
## Generates a resume using a formatted markdown file
### Source LaTeX can be found [here](https://github.com/ekohilas/two-column-resume-latex)

To compile:
``make``

To compile tex only:
``make example.tex``

## Definitions

* Sections are defined using level 1 headings  
    ``# Education``
* Items are initiated using level 3 headings, which also creates an item heading  
    ``### University``
* Time is defined using level 5 headings  
    ``##### 2017 - Present``
* Subheadings are defined using level 4 headings  
    ``#### Degree``
* Item text is defined as normal paragraphs, noting that line breaks will be considered
* Item links are defined using level 6 headings  
    ``###### https://www.link.com``
* Sections are ended using a horizonal rule  
    `` --- ``
* Skill lists sections are defined with level 2 headings  
    ``## Skills``
* Each item of skill list is defined as a list item, seperated by a ``|``  
    ``* Basic | Language``

## Supports
* Commenting with strikethroughs  
    ``~~comment~~``
* Hyperlinks  
    ``[text](https://www.link.com)``  
* Insertion of raw latex code  
    ``` ``\pagebreak`` ```
* Escaping of reserved latex characters  

