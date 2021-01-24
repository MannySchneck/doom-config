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

(after! lsp-mode
  (setq lsp-ui-sideline-enable nil))

(add-to-list 'org-capture-templates
'("mn" "Personal notes" entry
(file+headline +org-capture-notes-file "Inbox")
"* Note\n%i" :prepend t :kill-buffer t)
)

(setq org-todo-keyword-faces
'(("[-]"  . +org-todo-active)
  ("STRT" . "#9C70C2")
  ("[?]"  . +org-todo-onhold)
  ("WAIT" . +org-todo-onhold)
  ("HOLD" . +org-todo-onhold)
  ("PROJ" . +org-todo-project))))

(defun cbio-gitlink ()
    (interactive)
  (if-let (filename (or buffer-file-name (bound-and-true-p list-buffers-directory)))
      (let*
          ((root-stem (expand-file-name (directory-file-name (vc-git-root buffer-file-name))))
           (proj-name (file-name-base (directory-file-name (vc-git-root buffer-file-name))))
           (github-link (concat "https://github.com/cerebrae/"
                                proj-name "/blob/master"
                                (string-remove-prefix root-stem buffer-file-name))))
        (message (kill-new
                  github-link))
        (browse-url github-link))
    (error "Couldn't find filename in current buffer")))

(defun dbgref ()
  (interactive)
   (if-let (filename (or buffer-file-name (bound-and-true-p list-buffers-directory)))
       (message (kill-new (concat filename ":" (number-to-string (line-number-at-pos)))))
     (error "Couldn't find filename in current buffer")))

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(load-theme 'zenburn t)

;; Turn off company for magit commits
;;
(add-hook 'text-mode-hook #'(lambda () (company-mode -1)))

;; lsp needs to ignore go vendor
(after! lsp-mode (push "[/\\\\]vendor\\'" lsp-file-watch-ignored))

(after! projectile
  (push "vendor" projectile-globally-ignored-directories))

(defun cbio/grep-repos ()
  (interactive)
  (let ((default-directory "~/cbio/repo"))
    (+ivy/project-search-from-cwd)))
