# Corpora: A collection of reformatted texts for use with CCR tools.

This document explains the procedure for cleaning and adding the corpora texts. For a list of included texts, please see [INDEX.pdf](INDEX.pdf).

## Source texts

The sources are the Gutenberg plain text UTF-8 files. We save the initial, unchanged versions, as downloaded
from [gutenberg.org](www.gutenberg.org) in a folder for the relevant corpus.

This process has been followed for the two most recent CLiC corpora, ChiLit and Arts. The initial files are available from previous commits to this repository:

- [initial versions of ChiLit files added 2017-09-10](https://github.com/birmingham-ccr/corpora/tree/a020b2a7153baf8849056be833861ecb3d77e7a1/ChiLit)
- [initial versions of ArTs files added 2017-10-26](https://github.com/birmingham-ccr/corpora/tree/026a8436bf9ea3282d283a05725c0153e023d74c/Other) (this corpus was originally called "Other")
- [initial versions of ArTs files added 2019-01-16](https://github.com/birmingham-ccr/corpora/commit/1018b422c709b08cb5dbb3fc066dad8d15c0b3fd#diff-b90e831a9520a85b9e7620aa1fac6591) (as part of the ArTs expansion)

Also note that the initial file for `gulliver` is found in the initial downloads for ChiLit above; the book was later moved to the ArTs corpus.

## <a name="se:cleaning"></a>Cleaning of corpora texts

After committing the initial files to the repository, we clean the texts according to the followings steps
by directly editing the text files. 

1. <a name="lst:line_endings"></a> Convert to unix line endings.

2. <a name="lst:non_auth"></a> Remove non-authorial text.

3. <a name="lst:title"></a> Reformat the book title and author to make consistent across all texts.

4. <a name="lst:chapters"></a> Reformat chapter headings to make consistent across all texts.

5. <a name="lst:manual"></a> Manual corrections

Each editing stages is committed and clearly documented with a commit message.
Accordingly, it is possible to see the history of a single file, see for example the [history of willows.txt](https://github.com/birmingham-ccr/corpora/commits/master/ChiLit/willows.txt).

Step [1] is achieved using the following command

     for f in ChiLit/*.txt; do dos2unix -m $f; done 

Steps [2](#lst:non_auth), [3](#lst:title) and [4](#lst:chapters) are done manually.

### Specifics of step [2](#lst:non_auth)

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
        
    In the case of `sketches`, the line
    
          [Picture which cannot be reproduced]

    was removed during editing, because other editions suggested that the line was 
    not part of the text but rather an editorial remark (see the [comment on the change](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#r32025083)).
    
-  **Footnotes** are removed if they are attached to the end of a text but left in if the footnote text
is included in main text. (This rule was formally introduced for the [expansion of the ArTs corpus, 2019-01](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#diff-b90e831a9520a85b9e7620aa1fac6591L25366), although it was likely also followed implicitly for the previous corpora).

   When removing footnotes, delete both the in-text footnote indicator and the footnote itself.
   In the following example from `sketches`, the {161} in the text [was removed](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#diff-b90e831a9520a85b9e7620aa1fac6591L7281)
   
        On both sides of the gaol, is a small
        receiving-room, to which prisoners are conducted on their first
        reception, and whence they cannot be removed until they have been
        examined by the surgeon of the prison. {161}
    
   [along with the footnote text](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#diff-b90e831a9520a85b9e7620aa1fac6591L26670):
   
        {161}  The regulations of the prison relative to the confinement of
        prisoners during the day, their sleeping at night, their taking their
        meals, and other matters of gaol economy, have been all altered-greatly
        for the better—since this sketch was first published.  Even the
        construction of the prison itself has been changed.
        
   Note this is just one of the [four footnotes removed in `sketches`](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#diff-b90e831a9520a85b9e7620aa1fac6591L26663). 
   Other books for which footnotes were removed include [`americannotes`](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#diff-97c35dfce2b9f9b909ebb3f89ae43e2c), 
   [`pictures`](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#diff-dae9e8214d88284bc935c3a2b5ebce82) and [`uncommercial`](https://github.com/birmingham-ccr/corpora/commit/c72cc1809c22c3f45f2e3158df87545fdce58d28#diff-f573870f5118cfc91ff22ca3de87a75f).
   
   By contrast, an example of a footnote that was retained because it was fully included
   in the main text is the following in [`timemachine`](https://github.com/birmingham-ccr/corpora/blob/ca01d2ae9731b7a43d469422b85deb0bc1c486f3/ArTs/timemachine.txt#L2231):
   
       “Suddenly Weena came very close to my side. So suddenly that she
       startled me. Had it not been for her I do not think I should have
       noticed that the floor of the gallery sloped at all. [Footnote: It may
       be, of course, that the floor did not slope, but that the museum was
       built into the side of a hill.—ED.]
       
   ChiLit also contains examples of retained footnotes, for example several in `rival`,
   such as the following ([see location in text](https://github.com/birmingham-ccr/corpora/blob/ca01d2ae9731b7a43d469422b85deb0bc1c486f3/ChiLit/rival.txt#L2504))
   
       "By the mercy of Heaven, we met some Brazilian proas, which took us on
       board, and the Diomede in tow; and, having favourable winds and a smooth
       sea, we contrived to get the hulk into the King's dock at Rio de
       Janeiro; where, being a fine new ship, she was found worth repairing and
       refitting; and here we have been ever since, the Portuguese workmen
       being very slow in their operations."[6]

       [Footnote 6: Commodore Byron found some repairs necessary at Rio de
       Janeiro.--"We had six Portuguese caulkers to assist our carpenters, who
       were paid at the rate of 6s. per diem; though it is certain an English
       caulker could do as much in one day as they did in three; but, though
       slow and inactive, they perform their work very effectually."
       
### Specifics of Steps [3](#lst:title) and [4](#lst:chapters)

-   The **book title** is put on the first line of the file, without any
    newlines.
-   The **book author** is put on the second line of the file, without any
    newlines.
-   Both the **book title** and the **book author** should be in title case
(*not* in all capitals! - that would confuse the CLiC client), for example

          American Notes for General Circulation
          Charles Dickens

-   **Chapter headings** are formatted as follows: If the chapter heading
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

-   **Part headings** are on a line before the first chapter of that part,
    in the same format (i.e. "PART" has to be followed by a Roman or Arabic
    numeral). Blank lines are allowed between the part heading and the chapter
    heading. The following example is from `treasure`. 
    

        PART 2. The Sea-cook




        CHAPTER 7. I Go to Bristol

        IT was longer than the squire imagined ere we were ready for the sea,
        and none of our first plans--not even Dr. Livesey's, of keeping me
        
    In the CLiC dropdown menu, the part and chapter headings are joined together,
    i.e. this `treasure` chapter is shown as "PART 2. The Sea-cook CHAPTER 7. I Go to Bristol".
    Whereas `treasure` contains "PART" headings in the original text that only had to
    be [reformatted](https://github.com/birmingham-ccr/corpora/commit/b3bf771a72a523554fbec011dfaf6e44d35b1ae8#diff-833d382b4e9e60c1c7f9182dd7ebd234), sometimes "PART" (and a number) has to be added
    to the existing headings in order to represent the structure of the book correctly
    in the CLiC dropdown menu. An example where the headings had to be adjusted accordingly 
    is `sketches`. The table of contents in a [scanned copy of the book](https://archive.org/details/in.ernet.dli.2015.501383/page/n7)
    illustrates its nested structure. This table of contents does not reproduce all levels;
    for example, the chapters within "CHARACTERS" and "TALES" contain a further level of chapters.
    As CLiC can only handle parts and chapters but no third level, we solved this issue by first adding
    the numbered parts to the headings ("PART 4." in the following), joining it with the top
    chapter level ("CHAPTER I. THE BOARDING-HOUSE") and therefore accounting for the extra chapter level (CHAPTER I.)
    on level 2
    
    
         PART 4. TALES CHAPTER I. THE BOARDING-HOUSE


          CHAPTER I.
          
    These extra levels are not very frequent in `sketches`, but when they occur, they are not
    necessarily numbered conventionally but e.g. "CHAPTER THE SECOND". In that instance, we added
    only "CHAPTER" to count this as a chapter.
    
         The advertisement has again appeared in the morning papers.  Results must
         be reserved for another chapter.


         CHAPTER. CHAPTER THE SECOND.


         ‘Well!’ said little Mrs. Tibbs to herself, as she sat in the front
         parlour of the Coram-street mansion one morning, mending a piece of
         stair-carpet off the first Landings;—‘Things have not turned out so
         badly, either, and if I only get a favourable answer to the
         advertisement, we shall be full again.’

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
