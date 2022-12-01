% jnlpbbl_1.5.bst for NLP (The Association for Natural Language Processing)
% BST file For Japanese papers, used by jbibtex command.

% 07-Sep-06 by Nakanishi Printing Co., Ltd. (for 2e version)
% 18-Feb-04 by hmatui@jaist.ac.jp (debugged and adjusted to new features)
% 13-Jan-95 by m_yama@pluto.ai.kyutech.ac.jp (renamed from theapa to nlpbbl)
% 07-Dec-94 by nakamura@ai.kyutech.ac.jp (BUG comment update)
% 06-Nov-94 by nakamura@ai.kyutech.ac.jp

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  jtheapa.bst   by Gunji Takao (93.01.15) based on:
%$$$ theapa.bst $$$ --- Version 2.5.1 (May 1992)
%    by Young U. Ryu (young@emx.utexas.edu)

%% enfancements: treats Japanese names correctly
%%		 sorting with the yomi field

% copyright (C) 1991, 1992.
%    Young U. Ryu
% newapa.bst 2.0 - 1991.
%    Young U. Ryu
% newapa.bst - copyright (C) 1989, 1990.
%    Stephen N. Spencer
% apalike.bst - copyright (C) 1986, 1988.
%    Susan King and Oren Patashnik
% alpha.bst - copyright (C) 1985.
%    Oren Patashnik

% Version 2.5 Update Notes (April 1992)
%
%    - \BUcase is dropped. It means that BibTeX always
%      changes cases of article titles.
%    - If you don't want to change cases of article titles,
%      see comments following `FUNCTION {format.title}'.
%    - See update notes in `theapa.sty'.

% Version 2.4 Update Notes (April 1992)
%
%    - See update notes in `theapa.sty'.

% Version 2.3 Update Notes (March 1992)
%    - See update notes in `theapa.sty'.

% Version 2.2 Update Notes (March 1992)
%
%    - A bug reported by Richard Dallaway <richardd@cogs.sussex.ac.uk>:
%
%	     two periods after the title of MISC entries
%	     (also two periods after the title of BOOKLET entries)
%
%      is fixed by adding a function {output.atitle} and modifying
%      functions {booklet} and {misc}.
%    - A bug reported by someone (Sorry, I lost his/her E-mail.):
%
%	     incorrect order of references, e.x.
%	       Bond K. \&\ Scott L.
%	       Bond P. \&\ Scott L.
%	       Bond K. \&\ Wright O. % This line must come before the above
%
%      is fixed by switching first two lines of the function {presort}.
%    - The function {unpublished} is changed to avoid potential errors.

% Version 2.1 Update Notes
%    - See update notes in `theapa.sty'.

% Tutorial Notes
%    - See tutorial notes in `theapa.sty'.

% Copying of this file is authorized only if either
% (1) you make absolutely no changes to your copy, including names, or
% (2) if you do make changes, you name it something other than
% btxbst.doc, plain.bst, unsrt.bst, alpha.bst, and abbrv.bst.
% This restriction helps ensure that all standard styles are identical.

% Requirements: BibTeX 0.99a (or higher?),
%	       theapa.sty 2.4 under LaTeX 2.09 (or higher?)
%
%  NO GUARANTEE, absolutely (You know what I mean.)!!!

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
    yomi
    url %%%% added (jnlp_2e)
  }
  {}
  { label extra.label sort.label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output.atitle.nonnull}
{ 's :=
  output.state mid.sentence =
    { "\ " * write$ }
    { output.state after.block =
	{ "\ " * write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { "\ " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.atitle}
{ duplicate$ empty$
    'pop$
    'output.atitle.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.atitle.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.atitle.nonnull
  if$
}

FUNCTION {output.year.check}
{ year empty$
     { "empty year in " cite$ * warning$ }
     { write$
	" \BBOP " year * extra.label * "\BBCP" *
	mid.sentence 'output.state :=
     }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { duplicate$ is.kanji.str$
	{ "\Jem{" swap$ * "}" * }
	{ "{\Bem " swap$ * "}" * }
      if$
    }
  if$
}

FUNCTION {emphasize.space}
{ duplicate$ empty$
    { pop$ "" }
    { duplicate$ is.kanji.str$
	{ "\Jem{" swap$ * "}" * }
	{ "{\Bem " swap$ * "\/}" * }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s is.kanji.str$
	{ s nameptr "{ff}{ll}" format.name$ 't :=}
	{ s nameptr "{vv~}{ll}{, jj}{, F.}" format.name$ 't :=}
      if$
      nameptr #1 >
	{ namesleft #1 >
	    { s is.kanji.str$
		{"\JBA " * t * }
		{ ", " * t * }
	      if$
	    }
	    { numnames #2 >
		{ s is.kanji.str$
		    { "" * }
		    { "," * }
		  if$
		}
%		    'skip$
		    'skip$
		  if$
	          t "others" =
		    { s is.kanji.str$
		        { " \Jetal " * }
		        {" et~al." * }
		      if$
		    }
		    { s is.kanji.str$
		        { "\JBA " * t * }
%		        { "\BBACOMMA\ " * }
			{ numnames #2 =
			    { "\BBACOMMA\ \BBA\ " * t * }
		            { " \BBA\ " * t * }
			  if$
			}
		      if$
		    }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
	{ editor is.kanji.str$
	    { "\JEDS" * }
	    { "\BEDS" * }
	  if$
	}
	{ editor is.kanji.str$
	    { "\JED" * }
	    { "\BED" * }
	  if$
	}
      if$
    }
  if$
}

%%FUNCTION {format.editors.dot}  %% no need for a dot after (ed.) and (eds.)
FUNCTION {format.editors.nodot}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
	{ editor is.kanji.str$
	    { "\JEDS\" * }
	    { "\BEDS\" * }
	  if$
	}
	{ editor is.kanji.str$
	    { "\JED\" * }
	    { "\BED\" * }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

%FUNCTION {format.title}
%{ title empty$
%    { "" }
%    { "\BBOQ " title "t" change.case$ * "\BBCQ" *}
%  if$
%}

% If you don't want to change cases of article titles,
% use the following `format.title' function instead the one.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%FUNCTION {format.title}
%%%%{ title empty$
%%%%    { "" }
%%%%    { title is.kanji.str$
%%%%	{ "\JBOQ " title * "\JBCQ" *}
%%%%	{ "\BBOQ " title * "\BBCQ" *}
%%%%      if$
%%%%    }
%%%%  if$
%%%%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% revised (jnlpbbl_1.4.bst)
FUNCTION {format.title}
{ title empty$
    { "" }
    { title is.kanji.str$
	{ title add.period$ }
	{ "\BBOQ " title add.period$ * "\BBCQ" *}
      if$
    }
  if$
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

FUNCTION {format.btitle}
{ edition empty$
  { title emphasize }
  { title empty$
    { title emphasize }
    { title is.kanji.str$
	{ "\Jem{" title * "} (" * edition * " \JEd)" * "." * }
	{ "{\Bem " title * "\/} (" * edition * " \BEd)" * "." * }
      if$
    }
    if$
  }
  if$
}

FUNCTION {format.emphasize.booktitle}
{ edition empty$
  { booktitle emphasize }
  { booktitle empty$
    { booktitle emphasize }
    { booktitle is.kanji.str$
	{ "\Jem{" booktitle * "} (" * edition * " \JEd)" * "." * }
	{ "{\Bem " booktitle * "\/} (" * edition * " \BEd)" * "." * }
      if$
    }
    if$
  }
  if$
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { "\ " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { title is.kanji.str$
	{ series empty$
	    'skip$
	    { ", " * series emphasize * }
	  if$
	  volume "\JVOL" *
	}
	{ "\lowercase{\BVOL}" volume tie.or.space.connect
	  series empty$
	    'skip$
	    { " of " * series emphasize * }
	  if$
	}
      if$
      "\losercase{\BVOL\ and \BNUM}" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
	{ series field.or.null }
	{ title is.kanji.str$
	    { series empty$
		{ "there's a number but no series in " cite$ * warning$ }
		{ ". " * series * }
	      if$
	      number "\JNUM" *
	    }
	    { output.state mid.sentence =
		{ "\lowercase{\BNUM}" }
		{ "\BNUM" }
	      if$
	      number tie.or.space.connect
	      series empty$
		{ "there's a number but no series in " cite$ * warning$ }
		{ " in " * series * }
	      if$
	    }
	  if$
	}
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { title is.kanji.str$
	{ edition "\JEd" * }
	{ output.state mid.sentence =
	    { edition "l" change.case$ " \BEd" * }
	    { edition "t" change.case$ " \BEd" * }
	  if$
	}
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
%	{ "\BPGS" pages n.dashify tie.or.space.connect }
%	{ "\BPG" pages tie.or.space.connect }
	{ "\mbox{\BPGS" pages n.dashify tie.or.space.connect "}" * }
	{ "\mbox{\BPG" pages tie.or.space.connect "}" * }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ number empty$
    { volume empty$
       'skip$
       { title is.kanji.str$
%%%%	   { "\Bbf{" volume * "}" * }  %%%% jnlpbbl_1.2.bst
	   { "{\Bbf " volume * "}" * }
%%	   { "{\Bem " volume * "}" * }  %% volume no. in \bf (Gunji)
	   { "{\Bbf " volume * "}" * }
	 if$
       }
      if$
    }
%%    { volume emphasize.space  %% volume no. in \bf (Gunji)
    { "{\Bbf " volume * "} " *
      volume empty$
       {"there's a number but no volume in " cite$ * warning$ }
       { " (" number * ")" * * }
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
      { pop$ format.pages }
      { ", " * format.pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { title is.kanji.str$
	{ type empty$
	    { chapter " \JCH" * }
	    { type "l" change.case$ }
	  if$
	}
	{ type empty$
	    { "\BCH" }
	    { type "l" change.case$ }
	  if$
	  chapter tie.or.space.connect
	}
      if$
      pages empty$
	'skip$
	{ ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	 { booktitle is.kanji.str$
	     'format.emphasize.booktitle
	     { "In " format.emphasize.booktitle * }
	   if$
	 }
	 { booktitle is.kanji.str$
	     { format.editors ", " * format.emphasize.booktitle * }
	     { "In " format.editors * ", " * format.emphasize.booktitle * }
	   if$
	 }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {empty.webpage.check} %%%% added (jnlp_2e)
{ author empty$ title empty$ howpublished empty$
  url empty$ note empty$
  and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { title is.kanji.str$
	{ "\JTR" }
	{ "\BTR" }
      if$
    }
    { type "t" change.case$ }
  if$
  number empty$
    'skip$
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
	{ "need key or journal for " cite$ * " to crossref " * crossref *
	  warning$
	  ""
	}
	{ journal is.kanji.str$
	    { "\Jem{" journal * "}" * }
	    { "In {\Bem " journal * "\/}" * }
	  if$
	}
      if$
    }
    { "In " key * }
  if$
  " \citeyear{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor is.kanji.str$
     { editor #1 "{ff}" format.name$ duplicate$
       empty$
	   { pop$ editor #1 "{ll}" format.name$ }
	   'skip$
       if$
     }
     { editor #1 "{vv~}{ll}" format.name$ }
  if$
  editor num.names$ duplicate$
  #2 >
    { editor is.kanji.str$
	{ pop$ "\Jetal " * }
	{ pop$ " et~al." * }
      if$
    }
    { #2 <
	'skip$
	{ editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { editor is.kanji.str$
		{"\Jetal " *}
		{"et~al." * }
	      if$
	    }
	    { editor is.kanji.str$
		{"\JBA " *
		   editor #2 "{ff}" format.name$ duplicate$
			empty$
			    { pop$ editor #2 "{ll}" format.name$ }
			    'skip$
			if$
		  *
		}
		{ "\BBACOMMA\ \BBA\ " * editor #2 "{vv~}{ll}" format.name$ * }
	      if$
	    }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      title is.kanji.str$
	{ "" }
	{ "In " }
      if$
    }
    { title is.kanji.str$
	{ volume "\JVOL" * }
	{ "\BVOL" volume tie.or.space.connect
	  " of " *
	}
      if$
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ series empty$
	    { "need editor, key, or series for " cite$ * " to crossref " *
	      crossref * warning$
	      "" *
	    }
	    { series is.kanji.str$
		{ "\Jem{" * series * "}" * }
		{ "{\Bem " * series * "\/}" * }
	      if$
	    }
	  if$
	}
	{ key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \citeyear{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
	{ booktitle empty$
	    { "need editor, key, or booktitle for " cite$ * " to crossref " *
	      crossref * warning$
	      ""
	    }
	    { booktitle is.kanji.str$
		{ "\Jem{" booktitle * "}" *}
		{ "In {\Bem " booktitle * "\/}" * }
	     if$
	    }
	  if$
	}
	{ "In " key * }
      if$
    }
    { "In " format.crossref.editor * }
  if$
  " \citeyear{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { journal emphasize "journal" output.atitle.check
      format.vol.num.pages output
    }
    { format.article.crossref output.atitle.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
%% no need for a dot (.) (Gunji)
%%    { format.editors.dot "author and editor" output.check }
    { format.editors.nodot "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  output.year.check
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  author format.key output
  output.year.check
  new.block
  format.btitle "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
%%    { format.editors.dot "author and editor" output.check }
    { format.editors.nodot "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
	{ "author and editor" editor either.or.check }
	'skip$
      if$
    }
  if$
  output.year.check
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.atitle.check
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { format.incoll.inproc.crossref output.atitle.nonnull
      format.chapter.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.atitle.check
      format.bvolume output
      format.number.series output
      format.pages output
      address empty$
	{ organization publisher new.sentence.checkb
	  organization output
	  publisher output
	}
%%%%	{ address output.atitle.nonnull %%%% jnlpbbl_1.5.bst
	{ address output.nonnull
	  new.sentence
	  organization output
	  publisher output
	}
      if$
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
	'skip$
	{ organization output.nonnull
	  address output
	}
      if$
    }
    { format.authors output.nonnull }
  if$
  output.year.check
  new.block
  format.btitle "title" output.check
  author empty$
    { organization empty$
	{ address new.block.checka
	  address output
	}
	'skip$
      if$
    }
    { organization address new.block.checkb
      organization output
      address output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  "Master's thesis" format.thesis.type output.atitle.nonnull
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  "Master's report" format.thesis.type output.atitle.nonnull
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  output.year.check
  title howpublished new.block.checkb
  format.title "title" output.check
  howpublished new.block.checka
  howpublished output.atitle
%%%%  new.block    %%%% revised (jnlpbbl_1.4.bst)
%%%%  note output
  note output.atitle
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.btitle "title" output.check
  new.block
  "Ph.D.\ thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {dbathesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.btitle "title" output.check
  new.block
  "DBA thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {eddthesis}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.btitle "title" output.check
  new.block
  "Ed.D.\ thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
%%    { format.editors.dot output.nonnull }
    { format.editors.nodot output.nonnull }
  if$
  author format.key output
  output.year.check
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
	{ publisher new.sentence.checka }
	{ organization publisher new.sentence.checkb
	  organization output
	}
      if$
      publisher output
    }
    { address output.nonnull
      new.sentence
      editor empty$
	'skip$
	{ organization output }
      if$
      publisher output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.atitle.nonnull
  institution "institution" output.check
  address output
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  output.year.check
  new.block
  format.title "title" output.check
  new.block
  note output.atitle
  fin.entry
}

FUNCTION {default.type} { misc }

FUNCTION {format.url}  %%%% added (jnlp_2e)
{ url empty$
    { "empty url in " cite$ * warning$
      "" }
    { "\Turl{" url * "}" *}
  if$
}

FUNCTION {webpage} %%%% added (jnlp_2e)
{ output.bibitem
  format.authors output
  author format.key output
%%%%  title howpublished new.block.checkb
      title url new.block.checkb
  format.title output
%%%%  howpublished new.block.checka %%%% deleted 'howpublished' (jnlpbbl_1.4.bst)
%%%%  howpublished output
%%%%  format.url output
      url new.block.checka
      format.url output.atitle
  new.block
  note output
  fin.entry
  empty.webpage.check
}



MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

INTEGERS { et.al.char.used }

FUNCTION {initialize.et.al.char.used}
{ #0 'et.al.char.used :=
}

EXECUTE {initialize.et.al.char.used}

FUNCTION {format.full.lab.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s is.kanji.str$
	{ s nameptr "{ff}" format.name$ 't :=
	  t empty$
	      { s nameptr "{ll}" format.name$ 't :=}
	      'skip$
	  if$
	}
	{ s nameptr "{vv~}{ll}" format.name$ 't :=}
      if$
      nameptr #1 >
	{ namesleft #1 >
	    { s is.kanji.str$
		{ "\JBA " * t * }
	    	{ ", " * t * }
	      if$
	    }
	    { numnames #2 >
		{ s is.kanji.str$
		    { "" * }
		    { "," * }
		  if$
		}
%		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ s is.kanji.str$
%%%%		    { "\Jetal " * }
		    { " \Jetal " * } %%%% revised `jnlpbbl_1.4.bst`
		    { " et~al." * }
		  if$
		}
		{ s is.kanji.str$
		    { "\JBA " * t * }
		    { " \BBA\ " * t * }
		  if$
		}
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.lab.names}
{ 's :=
  s is.kanji.str$
     { s #1 "{ff}" format.name$ duplicate$
       empty$
	    { pop$ s #1 "{ll}" format.name$ }
	    'skip$
	if$
     }
     { s #1 "{vv~}{ll}" format.name$ }
  if$
  s num.names$ duplicate$
  #2 >
     { s is.kanji.str$
%%%%	{ pop$ "\Jetal " * } %%%% revised `jnlpbbl_1.4.bst`
	{ pop$ " \Jetal " * }
	{ pop$ " et~al." * }
     if$
     }
     { #2 <
	  'skip$
	  { s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
		{ s is.kanji.str$
		    {"\Jetal " *}
%%%%		    { "et~al. " * }
		    { " et~al. " * } %%%% revised 'jnlpbbl_1.4.bst'
		  if$
		}
		{ s is.kanji.str$
		    { "\JBA " *
		      s #2 "{ff}" format.name$ duplicate$
		      empty$
			  {pop$ s #2 "{ll}" format.name$}
			  'skip$
		      if$
		      *
		    }
		    { " \BBA\ " * s #2 "{vv~}{ll}" format.name$ * }
		  if$
		}
	     if$
	  }
       if$
     }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    { key #3 text.prefix$ }
	  if$
	}
	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
	{ organization empty$
	    { cite$ #1 #3 substring$ }
	    { "The " #4 organization chop.word #3 text.prefix$ }
	  if$
	}
	{ key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.label}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
	'editor.key.organization.label
	{ type$ "manual" =
	    'author.key.organization.label
	    'author.key.label
	  if$
	}
      if$
    }
  if$
  duplicate$

  author empty$
    { editor format.full.lab.names }
    { author format.full.lab.names }
  if$
  "\protect\BCAY{" swap$ * "}{" * swap$ * "}{" *
%%  year field.or.null purify$ #-1 #4 substring$ *
  year field.or.null purify$ *  %% to allow "to appear" in year
  'label :=
%%  year field.or.null purify$ #-1 #4 substring$ *
  year field.or.null purify$ *  %% to allow "to appear" in year
  sortify 'sort.label :=
}

FUNCTION {sort.format.names}
{ 's :=
  yomi empty$
     'skip$
     { yomi 's := }
  if$
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
	  { s is.kanji.str$
	      { "\Jetal " * }
	      { "et~al." * }
	    if$
	  }
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
	{ "to sort, need author or key in " cite$ * warning$
	  ""
	}
	{ key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { "to sort, need author, editor, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
	{ key empty$
	    { "to sort, need author, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
	{ key empty$
	    { "to sort, need editor, organization, or key in " cite$ * warning$
	      ""
	    }
	    { key sortify }
	  if$
	}
	{ "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ sort.label
  calc.label
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
	'editor.organization.sort
	{ type$ "manual" =
	    'author.organization.sort
	    'author.sort
	  if$
	}
      if$
    }
  if$
  *
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { last.sort.label next.extra }

INTEGERS { last.extra.num }

FUNCTION {forward.pass}
{ last.sort.label sort.label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      sort.label 'last.sort.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  label extra.label * "}" * 'label :=
  extra.label 'next.extra :=
}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "% JNLP Citation Style - 18-Feb-04" write$ newline$
  "\begin{thebibliography}{}"  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
