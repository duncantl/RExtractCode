mkE = function(f)
    list2env(getFunctionDefs(rmdCode(f)))

eSrc = function(f,  e = new.env())
{
    getFunctionDefs(f, envir = e)
    e
}
