# Corpora: A collection of reformatted texts for use with CCR tools.

This document explains the procedure for cleaning and adding the corpora texts. For a list of included texts, please see [INDEX.pdf](INDEX.pdf).

## Source texts

The sources of the English texts are the Gutenberg plain text UTF-8 files. We save the initial, unchanged versions, as downloaded
from [gutenberg.org](https://gutenberg.org/) in a folder for the relevant corpus.

This process has been followed for the two most recent CLiC corpora, ChiLit and Arts. The initial files are available from previous commits to this repository:

- [initial versions of ChiLit files added 2017-09-10](https://github.com/birmingham-ccr/corpora/tree/a020b2a7153baf8849056be833861ecb3d77e7a1/ChiLit)
- [initial versions of ArTs files added 2017-10-26](https://github.com/birmingham-ccr/corpora/tree/026a8436bf9ea3282d283a05725c0153e023d74c/Other) (this corpus was originally called "Other")
- [initial versions of ArTs files added 2019-01-16](https://github.com/birmingham-ccr/corpora/commit/1018b422c709b08cb5dbb3fc066dad8d15c0b3fd#diff-b90e831a9520a85b9e7620aa1fac6591) (as part of the ArTs expansion)

Also note that the initial file for `gulliver` is found in the initial downloads for ChiLit above; the book was later moved to the ArTs corpus.

The texts of the German “Deutsche Romane des 19. Jahrhunderts” (DE19) corpus originate from the [ELTeC-deu](https://distantreading.github.io/ELTeC/deu/index.html) collection. After a selection process aimed at ensuring that DE19 is comparable to the English 19C corpus in terms of size and gender balance, we converted the ELTeC XML files into plain text files, retaining chapter boundaries. Unlike the English corpora, in German texts, chapter titles are preceded by `###`, with a corresponding chapter segmentation rule added to `clictagger` to avoid making the tagger too language-specific.

## <a name="se:maintaining_repo"></a>Maintaining the corpora repository

Texts added to the corpora repository should be prepared according to the notes in the
[clictagger documentation](https://mahlberg-lab.github.io/clictagger/).

### <a name="se:corpus_bib_file"></a>`corpus.bib` files

Within each corpus directory, there is a ``corpus.bib`` file describing metadata about the file.
The important fields in the bib entries are:

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

### <a name="se:corpora_bib_file"></a>`corpora.bib` file

If you are adding a new corpus, you will also have to create a `@book`
entry for the corpus in ``corpora.bib``.
The important fields in the bib entries are:

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

### Adding a new text to a corpus

1.  Clean the text as described in
    Section [2](#se:cleaning).

2.  Add entry to the relevant `corpus.bib` file; see
    Section [3.1](#se:corpus_bib_file).

### Adding a new corpus

1.  Add a new folder to the corpus repository.

2.  Add an entry to the `corpora.bib` file for the corpus; see
    Section [3.1](#se:corpora_bib_file).

3.  Then add each text as above.

### Merging

Once finished, [open a pull request on GitHub to merge your work](https://github.com/mahlberg-lab/corpora/compare).

A preview will be generated showing the tagging for all changed files.

[^1]: <http://search.cpan.org/perldoc?Text::Unidecode>

[^2]: <https://tools.ietf.org/html/rfc20>

[^3]: <https://tools.ietf.org/html/rfc3629>
