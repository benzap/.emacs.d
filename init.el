(load "~/.emacs.d/sanemacs.el" nil t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; TODO: use-package for zig-mode
(use-package zig-mode
  :bind (("<f5>" . compile)
	 ("<f6>" . recompile)
	 ("C-<f5>" . compile)
	 ("C-<f6>" . recompile)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
    '(zig-mode . (
      ;; Use `zls` if it is in your PATH
      "zls"
      ;; There are two ways to set config options:
      ;;   - edit your `zls.json` that applies to any editor that uses ZLS
      ;;   - set in-editor config options with the `initializationOptions` field below.
      ;;
      ;; Further information on how to configure ZLS:
      ;; https://zigtools.org/zls/configure/
      :initializationOptions
        (;; Whether to enable build-on-save diagnostics
         ;;
         ;; Further information about build-on save:
         ;; https://zigtools.org/zls/guides/build-on-save/
         ;;enable_build_on_save t

         ;; omit the following line if `zig` is in your PATH
	 ;; :zig_exe_path "/path/to/zig_executable"
         )))))

(add-hook 'zig-mode-hook 'eglot-ensure)
