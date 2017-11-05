;;; Compiled snippets and support files for `cmake-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cmake-mode
		     '(("set" "set(${1:var} ${2:value})" "set" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/set" nil nil)
		       ("proj" "project ($0)" "project" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/project" nil nil)
		       ("opt" "option (${1:OPT} \"${2:docstring}\" ${3:value})" "option" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/option" nil nil)
		       ("msg" "message(${1:STATUS }\"$0\")" "message" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/message" nil nil)
		       ("macro" "macro(${1:name}${2: args})\n\nendmacro()" "macro" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/macro" nil nil)
		       ("inc"
			(progninclude
			 ($0))
			"include" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/include" nil nil)
		       ("if" "if(${1:cond})\n        $2\nelse(${3:cond})\n        $0\nendif()" "ifelse" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/ifelse" nil nil)
		       ("if" "if(${1:cond})\n   $0\nendif()" "if" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/if" nil nil)
		       ("fun" "function (${1:name})\n         $0\nendfunction()" "function" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/function" nil nil)
		       ("for" "foreach(${1:item} \\${${2:array}})\n        $0\nendforeach()" "foreach" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/foreach" nil nil)
		       ("min" "cmake_minimum_required(VERSION ${1:2.6})" "cmake_minimum_required" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/cmake_minimum_required" nil nil)
		       ("lib" "add_library($1 ${2:class.cpp})\ntarget_link_libraries($1 $3)" "add_library" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/add_library" nil nil)
		       ("exe" "add_executable($1 ${2:main.cpp})\ntarget_link_libraries($1 $3)" "add_executable" nil nil nil "c:/Users/benzap/.emacs.d/snippets/cmake-mode/add_executable" nil nil)))


;;; Do not edit! File generated at Sun Nov  5 04:51:53 2017
