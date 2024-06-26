# doc = readPDFXML("zhangcharles_372202_24178831_project2-F.xml")

fromPage =
function(p, fontInfo = getFontInfo(as(p, "XMLInternalDocument")))
{
    bb = getBBox(p)
    txt = getBBox2(p, TRUE, attrs = c("left", "top", "width", "height", "rotation", "font"))

    unname(apply(bb, 1, getCodeWithinRect, txt, simplify = FALSE, fontInfo = fontInfo))
}

getCodeWithinRect =
function(rect, textBB, threshold = 5, fontInfo = NULL)
{
    txt = subset(textBB, left >= rect["x0"] & left + width <= rect["x1"] & top > min(rect[c("y0", "y1")]) &
                         top + height < max(rect[c("y0", "y1")]))


    if(nrow(txt) == 0)
        return(character())


    if(nrow(txt) == 1)
        return(entities(txt$text))
    
    groups = groupByLine(txt, threshold)
    
    g = split(txt, groups)

    sapply(g, txtFromGroup, fontInfo = fontInfo)
}

groupByLine =
function(txt, threshold = 5)
{
    p = txt$top + txt$height
    d = dist(p)
    cl = hclust(d, 'single')
    cutree(cl, h = threshold)
}


txtFromGroup =
function(els, fontInfo = NULL)    
{
    o = order(els$left)
    els = els[o,]

    if(!is.null(fontInfo)) {
        seps = els$left[-1] - (els$left + els$width)[1:(nrow(els)-1)]
        m = match(els$font, fontInfo$id)
        fontSize = fontInfo$size[m]
#        if(nrow(els) > 1) browser()
        sp = c("", " ")[ (seps > fontSize[-1]*.5) + 1L]
        tmp = paste(els$text, c(sp, ""), collapse = "", sep = "")        
    } else
        tmp = paste(els$text, collapse = " ")
    

    entities(tmp)
}

entities =
function(x)    
{
    map = c("lt" = "<", gt = ">", amp = "&", quot = '"')
    ent = sprintf("&%s;", names(map))
    names(ent) = names(map)

    for(i in names(map)) 
        x = gsub(ent[i], map[i], x, fixed = TRUE)
    
    x
}

        
        

getRCode =
function(pdf, doc = readPDFXML(pdf), pages = getPages(doc), fontInfo = getFontInfo(doc))
{
    tmp = lapply(pages, fromPage, fontInfo = fontInfo)
    tmp
#  unlist(tmp, recursive = FALSE)
}

