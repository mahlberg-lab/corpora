# Corpora: A collection of reformatted texts for use with CCR tools.

This document explains the procedure for cleaning and adding the corpora texts. For a list of included texts, please see [INDEX.pdf](INDEX.pdf).


## <a name="se:cleaning"></a>Cleaning of corpora texts

The sources were the Gutenberg plain text UTF-8 files.

1. <a name="lst:line_endings"></a> Convert to unix line endings.

2. <a name="lst:non_auth"></a> Remove non-authorial text.

3. <a name="lst:title"></a> Reformat the book title and author to make consistent across all texts.

4. <a name="lst:chapters"></a> Reformat chapter headings to make consistent across all texts.

5. <a name="lst:manual"></a> Manual corrections

Steps [2](#lst:non_auth), [3](#lst:title) and [4](#lst:chapters) were done manually.

Step [1] was achieved using the following command

     for f in ChiLit/*.txt; do dos2unix -m $f; done 

Some specifics of step [2](#lst:non_auth):

-   Tables of content are removed.

-   Lists of illustrations are removed.

-   Any preface text attributed to a person other than the author is
    removed. When attribution is unclear the text is left.

-   Any postface text attributed to a person other than the author is
    removed. When attribution is unclear the text is left.

-   Transcriber notes are removed.

-   In the texts illustrations are usually indicated by text enclosed in
    square brackets. Where this text includes a caption the caption is
    kept, for example

         [Illustration: THE WONDERSTONE.] 

    becomes

         [THE WONDERSTONE.] 

    Where there is no authorial caption the construct is deleted. All
    the following example would be deleted

         [Illustration] 

         [Illustration: Chapter Seventeen] 

         [Illustration: Page 91] 

-   The book title is put on the first line of the file, without any
    newlines.

-   The book author is put on the second line of the file, without any
    newlines.

-   Chapter headings are formatted as follows: If the chapter heading
    begins with 'CHAPTER' or 'BOOK' it must be followed by a number or
    roman numerals and then a dot. The chapter or book number cannot be
    written in word form. The heading can optionaly be followed by a
    chapter title; the chapter title must not break onto a new line.
    Here are some examples

         CHAPTER 1. The Old Sea-dog at the Admiral Benbow

         CHAPTER 2. TRAVELLING COMPANIONS.

         CHAPTER 3.

         CHAPTER IV. Little Meg's Treat to Her Children

         CHAPTER V.

         BOOK 1.

         BOOK II. Jessica's Mother

    Sections beginning with 'INTRODUCTION', 'PREFACE', 'CONCLUSION',
    'PROLOGUE', 'PRELUDE' or 'MORAL' are also be treated as seperate
    chapters. These do not require numbers, but do require the dot.
    Again the heading can optionaly be followed by a title; the title
    must not break onto a new line. Here are some examples

         PREFACE.

         INTRODUCTION.

         PROLOGUE. THE OLYMPIANS

         MORAL.--_There is no moral to this chapter._

    In all cases there must be no space at the beginning of the line.

-   Part headings are on a line before the first chapter of that part,
    in the same format. Blank lines are allowed between the part heading
    and the chapter heading. The following example is from Treasure
    Island

        PART TWO. The Sea-cook

        CHAPTER 7. I Go to Bristol

        IT was longer than the squire imagined ere we were ready for the sea,
        and none of our first plans--not even Dr. Livesey's, of keeping me

## <a name="se:ASCII"></a>Converting to 7-bit ASCII.

In addition, the Perl module `Text::Unidecode`[^1] can be used to unify
the use of hyphens, apostrophes and quotes across the texts with the
following command

     perl -C -MText::Unidecode -n -i -e'print unidecode($_)' */*.txt 

7-bit ASCII[^2] is a subset of UTF-8[^3] and so the files may be treated
as UTF-8. Note that this will also affect accents and other special
characters; for example, Hôtel becomes Hotel, archæologist becomes
archaeologist and £60,000 becomes PS60,000.

## <a name="se:maintaining_repo"></a>Maintaining the corpora repository

### <a name="se:bib_file"></a>`.bib` file

We currently manage the bibliography in a shared zotero folder. The
important fields in the bib entries are:

-   The `shorttitle` field must match the filename of the relevant text
    file in the corpus folder.

-   The `keywords` field must contain the name of the corpus.

-   The `title`, `author` and `date` fields must be present.

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

### Adding a new text to a corpus

1.  Clean the text as described in
    Section [2](#se:cleaning).

2.  Add entry to the `.bib` file; see
    Section [3.1](#se:bib_file).

3.  Update repository tags; see
    Section [3.4](#se:tags){reference-type="ref" reference="se:tags"}.

### Adding a new corpus

1.  Add an entry to the `.bib` file for the corpus; see
    Section [3.1](#se:bib_file).

2.  For each new corpus file

    1.  Clean the text as described in
        Section [2](#se:cleaning).

    2.  Add entry to the `.bib` file; see
        Section [3.1](#se:bib_file).

3.  Update repository tags; see
    Section [3.4](#se:tags).


### Repository Tags

TODO

## References

[^1]: <http://search.cpan.org/perldoc?Text::Unidecode>

[^2]: <https://tools.ietf.org/html/rfc20>

[^3]: <https://tools.ietf.org/html/rfc3629>
