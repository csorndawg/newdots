## ULTISNIPS PYTHON SNIPPET HELPER 
## REFERENCES:  http://vimcasts.org/episodes/ultisnips-python-interpolation/

########## VIMCAST EXAMPLE SNIPPET ########## 

## PYTHON CODE  

def fraction(a, b):
    try:
        return "%.1f" % (float(a)/float(b))
    except (ValueError, ZeroDivisionError):
        return "ERR"


## ULTISNIPS SNIPPET CODE
global !p
def fraction(a, b):
    try:
        return "%.1f" % (float(a)/float(b))
    except (ValueError, ZeroDivisionError):
        return "ERR"
endglobal

snippet 75wrds "Log a 750words.com session" b
750words.com: ${1:750} words in ${2:20} minutes - `!p
snip.rv = fraction(t[1], t[2])
` wpm.
endsnippet


########## ACTUAL SNIPPETS ########## 

