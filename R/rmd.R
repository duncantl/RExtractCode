rmdTangle =
function(file, parse = FALSE, quiet = TRUE, ...)
{
    con = textConnection("out", "w", local = TRUE)
    on.exit(close(con))
    knit(file, con, tangle = TRUE, quiet = quiet, ...)
    code = textConnectionValue(con)
    
    if(parse)
        parse(text = code)
    else
        code
}

rmdCode =
function(f) 
    parse(purl(f, output = gsub("\\.[Rr]md$", ".R", f), documentation = 0))



htmlCode =
function(doc, ...)
{
    if(is.character(doc))
        doc = htmlParse

    xpathApply(doc, "//pre[@class = 'R']", xmlValue, ...)
}
