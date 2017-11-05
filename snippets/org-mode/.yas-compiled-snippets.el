;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("verse_" "#+begin_verse\n        $0\n#+end_verse" "verse" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/verse" nil nil)
		       ("once" "#+TITLE: ${1:Title}\n#+AUTHOR: Benjamin Zaporzan\n#+DATE: ${2:`(format-time-string \"%Y-%m-%d\")`}\n#+EMAIL: benzaporzan@gmail.com\n#+LANGUAGE: en\n#+OPTIONS: H:2 num:t toc:t \\n:nil ::t |:t ^:t f:t tex:t\n$0" "once" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/once" nil nil)
		       ("matrix_" "\\left \\(\n\\begin{array}{${1:ccc}}\n${2:v1 & v2} \\\\\n$0\n\\end{array}\n\\right \\)" "matrix" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/matrix" nil nil)
		       ("latex_" "#+BEGIN_LaTeX\n$0\n#+END_LaTeX" "latex" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/latex" nil nil)
		       ("img_" "<img src=\"$1\"\n alt=\"$2\" align=\"${3:left}\"\n title=\"${4:image title}\"\n class=\"img\"\n</img>\n$0" "img" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/img" nil nil)
		       ("fig_" "#+CAPTION: ${1:caption}\n#+ATTR_LaTeX: ${2:scale=0.75}\n#+LABEL: fig:${3:label}\n" "figure" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/figure" nil nil)
		       ("entry_" "#+begin_html\n---\nlayout: ${1:default}\ntitle: ${2:title}\n---\n#+end_html\n$0" "entry" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/entry" nil nil)
		       ("emb_" "src_${1:lang}${2:[${3:where}]}{${4:code}}" "embedded" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/embedded" nil nil)
		       ("elisp_" "#+begin_src emacs-lisp :tangle yes\n$0\n#+end_src" "elisp" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/elisp" nil nil)
		       ("dot_" "#+begin_src dot :file ${1:file} :cmdline -T${2:pdf} :exports none :results silent\n            $0\n#+end_src\n\n[[file:$1]]" "dot" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/dot" nil nil)
		       ("dt" "| ! | Name   | qty | cal |  tot | left |\n|---+--------+-----+-----+------+------|\n|   | START  |   0 |   0 |    0 | ${1:1500} |\n$0\n   #+TBLFM: \\$5 = @-1\\$tot + \\$cal * \\$qty::\\$6 = @-1\\$left - \\$cal * \\$qty" "Diet Table" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/diettable" nil nil)
		       ("de" "| # | ${1:name}  | ${2:1} | $3 | 0 | 0 |" "Diet Entry" nil nil nil "c:/Users/benzap/.emacs.d/snippets/org-mode/dietentry" nil nil)))


;;; Do not edit! File generated at Sun Nov  5 04:51:55 2017
