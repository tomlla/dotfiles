(load-theme 'tango-dark t)


(setq inferior-lisp-program "sbcl")

(add-to-list 'load-path "/opt/slime")

(require 'slime-autoloads)

;(slime-setup)
(slime-setup '(slime-repl slime-fancy slime-banner))
(setq slime-net-coding-system 'utf-8-unix)
