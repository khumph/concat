# Middle is created with only sections

    Code
      cat(paste_middle(tlfs))
    Output
      \phantomsection
      \addcontentsline{toc}{section}{Section}
      \phantomsection
      \addcontentsline{toc}{subsection}{One}
      \includepdf[pages=-, pagecommand = {}]{Folder/file.pdf}
      
      \phantomsection
      \addcontentsline{toc}{subsection}{Two}
      \includepdf[pages=-, pagecommand = {}]{Folder/file2.pdf}
      

# Tex is created

    Code
      cat(paste_tex(tlfs, toc = FALSE, coverpage = NULL))
    Output
      \documentclass{article}
      \usepackage[landscape]{geometry}
      \renewcommand{\rmdefault}{phv}
      \renewcommand{\sfdefault}{phv}
      \usepackage{pdfpages}
      \usepackage[colorlinks=true,linkcolor=black]{hyperref}
      \setlength{\footskip}{1.2in}
      \setcounter{secnumdepth}{0} % sections and below are not numbered
      
      \begin{document}
      
      \phantomsection
      \addcontentsline{toc}{section}{Section}
      \phantomsection
      \addcontentsline{toc}{subsection}{One}
      \includepdf[pages=-, pagecommand = {}]{Folder/file.pdf}
      
      \phantomsection
      \addcontentsline{toc}{subsection}{Two}
      \includepdf[pages=-, pagecommand = {}]{Folder/file2.pdf}
      
      
      \end{document}

# Tex is created with a table of contents

    Code
      cat(paste_tex(tlfs, toc = TRUE, coverpage = NULL))
    Output
      \documentclass{article}
      \usepackage[landscape]{geometry}
      \renewcommand{\rmdefault}{phv}
      \renewcommand{\sfdefault}{phv}
      \usepackage{pdfpages}
      \usepackage[colorlinks=true,linkcolor=black]{hyperref}
      \setlength{\footskip}{1.2in}
      \setcounter{secnumdepth}{0} % sections and below are not numbered
      
      \begin{document}
      
      
      % Table of Contents ----------------------------------------------------------
      \addtocounter{page}{1}
      \thispagestyle{empty}
      \tableofcontents
      \thispagestyle{empty}
      \newpage
      
      % ----------------------------------------------------------------------------
      
      \phantomsection
      \addcontentsline{toc}{section}{Section}
      \phantomsection
      \addcontentsline{toc}{subsection}{One}
      \includepdf[pages=-, pagecommand = {}]{Folder/file.pdf}
      
      \phantomsection
      \addcontentsline{toc}{subsection}{Two}
      \includepdf[pages=-, pagecommand = {}]{Folder/file2.pdf}
      
      
      \end{document}

# Tex is created with a cover page

    Code
      cat(paste_tex(tlfs, toc = FALSE, coverpage = "\n\n\\begin{titlepage}\n\nThis is not really a cover page\n\n\\end{titlepage}\n\n"))
    Output
      \documentclass{article}
      \usepackage[landscape]{geometry}
      \renewcommand{\rmdefault}{phv}
      \renewcommand{\sfdefault}{phv}
      \usepackage{pdfpages}
      \usepackage[colorlinks=true,linkcolor=black]{hyperref}
      \setlength{\footskip}{1.2in}
      \setcounter{secnumdepth}{0} % sections and below are not numbered
      
      \begin{document}
      
      
      
      \begin{titlepage}
      
      This is not really a cover page
      
      \end{titlepage}
      
      \phantomsection
      \addcontentsline{toc}{section}{Section}
      \phantomsection
      \addcontentsline{toc}{subsection}{One}
      \includepdf[pages=-, pagecommand = {}]{Folder/file.pdf}
      
      \phantomsection
      \addcontentsline{toc}{subsection}{Two}
      \includepdf[pages=-, pagecommand = {}]{Folder/file2.pdf}
      
      
      \end{document}

