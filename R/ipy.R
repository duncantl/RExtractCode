ipyCode =
function(f)
  sapply(fromJSON(f)$cells, `[[`, "source")



