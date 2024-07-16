# RExtractCode

This package provides functions "convenience functions" to extract R code from different types of documents and to evaluate the
code. I use this when grading student assignments and I created the functions while grading. So they
were designed quickly and for specific tasks.

Sometimes a student only provides a PDF or HTML document.
Instead, they might provide an iPython notebook and not the R code directly.
Or they provide the R markdown document. 

I want to be able to 
+ check code parses,
+ get a list of all the functions defined and redefined in the code,
+ statically analyze the code, 
+ evaluate the code or parts of it.


Generally, I don't want to cut-and-paste code from the documents.

Also, cutting and pasting from a PDF generated from an R markdown file often
  does not preserve line breaks and modifies characters such as `^`.

