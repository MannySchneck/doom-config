;;; private/manny/config.el -*- lexical-binding: t; -*-
;;;
(load! "bindings")
; (def-package! avy
;   :commands (avy-goto-word-0-above avy-goto-word-0-below avy-goto-char-in-line)
;   :config
;   (setq avy-all-windows nil
;         avy-background t))

; (def-package! org-pomodoro
;   :commands (org-pomodoro))


(after! org
(add-to-list 'org-capture-templates
'("r" "Rant" entry
(file+headline "~/org/personal.org" "Rants")
"* Rant\n%i\n"
)
)
(add-to-list 'org-capture-templates
'("mn" "Personal notes" entry
(file+headline +org-capture-notes-file "Inbox")
"* Note\n%i" :prepend t :kill-buffer t)
)
)


(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(load-theme 'zenburn t)

;; Turn off company for magit commits
;;
(add-hook 'text-mode-hook #'(lambda () (company-mode -1)))
