library(jsonlite)
library(RefManageR)

corpora <- data.frame(
    "id" = c("DNov", "19C", "ChiLit", "ArTs"),
    "title" = c("Dickens's Novels", "19th Century Reference Corpus", "Children's Literature", "Additional Requested Texts"),
    stringsAsFactors = FALSE
)

b <- as.data.frame(ReadBib("../corpora.bib"), stringsAsFactors = FALSE)
content <- lapply(setNames(corpora$id, corpora$id), function(x) {
    tmp <- with(b, b[grepl(paste0('\\{?', x, '\\}?'), keywords), c('shorttitle', 'title', 'author', 'date')]) 
    tmp$path <- paste(x, paste0(tmp$shorttitle, '.txt'), sep = '/')
    row.names(tmp) <- NULL  # else end up in JSON
    return(tmp)
})

write_json(list(
    corpora = corpora,
    content = content
), path = '../corpora.json', pretty = TRUE)

