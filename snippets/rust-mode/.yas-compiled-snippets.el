;;; Compiled snippets and support files for `rust-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'rust-mode
		     '(("while" "while {$1:cond} {\n    {$2:()}\n}$0" "while cond { … }" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/while" nil nil)
		       ("warn" "#[warn(${1:lint_check})]$0" "#[warn(lint_check)]" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/warn" nil nil)
		       ("use" "use name;" "use name;" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/use" nil nil)
		       ("unsafe" "unsafe {\n    ${1:()}\n}$0" "unsafe { … }" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/unsafe" nil nil)
		       ("type" "type ${1:Name} = ${2:Type};$0" "type Name = Type;" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/type" nil nil)
		       ("test" "#[test]$0\n" "#[test]" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/test" nil nil)
		       ("static" "static ${1:NAME}: ${2:Type} = ${3:expr};$0" "static NAME: Type = expr;" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/static" nil nil)
		       ("mod" "mod ${1:name} {\n    ${2:()}\n}$0" "mod name { … }" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/mod" nil nil)
		       ("main" "fn main() {\n    ${1:()}\n}$0" "fn main() { … }" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/main" nil nil)
		       ("loop" "loop {\n    ${1:()}\n}$0" "loop { … }" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/loop" nil nil)
		       ("forbid" "#[forbid(${1:lint_check})]$0" "#[forbid(lint_check)]" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/forbid" nil nil)
		       ("for" "for ${1:name} in ${2:iterable} {\n    ${3:()}\n}$0\n" "for name in iterable { … }" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/for" nil nil)
		       ("deriving" "#[deriving(${1:Trait})]$0" "#[deriving(Trait)]" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/deriving" nil nil)
		       ("deny" "#[deny(${1:lint_check})]$0" "#[deny(lint_check)]" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/deny" nil nil)
		       ("const" "const ${1:NAME}: ${2:Type} = ${3:expr};$0" "const NAME: Type = expr;" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/const" nil nil)
		       ("cfg=" "#[cfg(${1:option} = \"${2:value}\")]$0" "#[cfg(option = \"value\")]" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/cfg=" nil nil)
		       ("cfg" "#[cfg(${1:option})]$0" "#[cfg(option)]" nil nil nil "c:/Users/benzap/.emacs.d/snippets/rust-mode/cfg" nil nil)))


;;; Do not edit! File generated at Sun Nov  5 04:51:56 2017
