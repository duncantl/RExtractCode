This provides functions to extract R code from different types of documents and to evaluate the
code. I use this when grading student assignments.
Sometimes they only provide the PDF or HTML document.
Instead, they might provide an iPython notebook and not the R code directly.
Or they provide the R markdown document. 

I want to be able to statically analyze the code and not just run it,
or evaluate it or parts of it.


+ Generally, I don't want to cut-and-paste code from the documents.

+ Cutting and pasting from a PDF generated from an R markdown file often
  does not preserve line breaks and modifies characters such as `^`.

