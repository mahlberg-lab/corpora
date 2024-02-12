# Corpora: A collection of reformatted texts for use with CCR tools.

This document explains the procedure for cleaning and adding the corpora texts. For a list of included texts, please see [INDEX.pdf](INDEX.pdf).

## Source texts

The sources are the Gutenberg plain text UTF-8 files. We save the initial, unchanged versions, as downloaded
from [gutenberg.org](https://gutenberg.org/) in a folder for the relevant corpus.

This process has been followed for the two most recent CLiC corpora, ChiLit and Arts. The initial files are available from previous commits to this repository:

- [initial versions of ChiLit files added 2017-09-10](https://github.com/birmingham-ccr/corpora/tree/a020b2a7153baf8849056be833861ecb3d77e7a1/ChiLit)
- [initial versions of ArTs files added 2017-10-26](https://github.com/birmingham-ccr/corpora/tree/026a8436bf9ea3282d283a05725c0153e023d74c/Other) (this corpus was originally called "Other")
- [initial versions of ArTs files added 2019-01-16](https://github.com/birmingham-ccr/corpora/commit/1018b422c709b08cb5dbb3fc066dad8d15c0b3fd#diff-b90e831a9520a85b9e7620aa1fac6591) (as part of the ArTs expansion)

Also note that the initial file for `gulliver` is found in the initial downloads for ChiLit above; the book was later moved to the ArTs corpus.

## <a name="se:maintaining_repo"></a>Maintaining the corpora repository

Texts added to the corpora repository should be prepared according to the notes in the
[clictagger documentation](https://mahlberg-lab.github.io/clictagger/).

### <a name="se:bib_file"></a>`.bib` file

We currently manage the bibliography in a shared zotero folder. The
important fields in the bib entries are:

-   The `shorttitle` field must match the filename of the relevant text
    file in the corpus folder.

-   The `keywords` field must contain the name of the corpus.

-   The `title`, `author` and `date` fields must be present.

-   The `editor` field is optional and refers to the people or group of people who
transcribed/edited the text for publication on gutenberg.org. We add this manually based
on any information in the initial text file from Project Gutenberg (not all text files contain
this).

Example entry:

        @book{grahame_wind_1908,
            title = {The Wind in the Willows},
            url = {https://www.gutenberg.org/ebooks/289},
            shorttitle = {willows},      <<===  filename willows.txt
            author = {Grahame, Kenneth},
            editor = {Lough, Mike},
            urldate = {2017-06-28},
            date = {1908},
            keywords = {{ChiLit}}        <<===  corpus id
        }
        
Make sure that the entries don't inclue extraneous information. For example, when using the
Zotero Chrome Add On to export a citation from gutenberg.org, Zotero tends to save licensing
information. This should be deleted from the Zotero entry.

For the `date` we try to establish the date of the first publication of the novel (or the work as
a whole, in the case of serialised works), using external information, such as Wikipedia entries.
We use this date of first publication rather than the date of the edition for the main historical context
of the novel. Although we do not explicitly record the edition of the book transcribed by Project Gutenber,
CLiC users can look for this information in the initial versions of the texts: initial versions of 

If you are adding a new corpus, you will also have to create a `@book`
entry for the corpus. The important fields in the bib entries are:

-   The `shorttitle` field must match the corpus id used in book
    `keywords`

-   The `title` field must be present.

-   The `number` field must be present, and is used to order the corpora
    in CLiC.

-   The `keyword` field must contain the keyword `corpus`.

Example entry:

        @book{cermakova_childrens_2017,
            location = {University of Birmingham, {UK}},
            title = {Children's Literature},
            series = {{CCR} Corpus},
            shorttitle = {{ChiLit}},
            number = {3},
            publisher = {Centre for Corpus Research},
            author = {Čermáková, A. and Mahlberg, M. and Wiegand, V.},
            date = {2017},
            keywords = {corpus}
        }

In order to export the required bib style from Zotero, choose "BibLaTeX" (not BibTeX!)
in Preferences -> Export. It appears that different versions of Zotero export different
sequences of `.bib` entries; please check before you update the file. If the sequence differs,
new entries can be added manually instead of rewriting the entire `.bib` file.

### Adding a new text to a corpus

1.  Clean the text as described in
    Section [2](#se:cleaning).

2.  Add entry to the `.bib` file; see
    Section [3.1](#se:bib_file).

3.  Update repository tags; see
    Section [3.4](#se:tags).

### Adding a new corpus

1.  Add a new folder to the corpus repository.

2.  Add an entry to the `.bib` file for the corpus; see
    Section [3.1](#se:bib_file).

3.  For each new corpus file

    1.  Clean the text as described in
        Section [2](#se:cleaning).

    2.  Add entry to the `.bib` file; see
        Section [3.1](#se:bib_file).

4.  Update repository tags; see
    Section [3.4](#se:tags).


### Repository Tags

TODO

[^1]: <http://search.cpan.org/perldoc?Text::Unidecode>

[^2]: <https://tools.ietf.org/html/rfc20>

[^3]: <https://tools.ietf.org/html/rfc3629>
