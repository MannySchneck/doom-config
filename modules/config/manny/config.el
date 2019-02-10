;;; private/manny/config.el -*- lexical-binding: t; -*-
;;;
(load! "bindings")
(def-package! avy
  :commands (avy-goto-word-0-above avy-goto-word-0-below avy-goto-char-in-line)
  :config
  (setq avy-all-windows nil
        avy-background t))

(def-package! org-jira
  :config
  (setq jiralib-url "https://encurate.atlassian.net/")
  )

(def-package! org-pomodoro
  :commands (org-pomodoro))
(def-package! stylus-mode)
(def-package! reason-mode)
(def-package! zenburn-theme
  :config
  (load-theme 'zenburn t))

(def-package! diminish)

(after! diminish
  (diminish 'ivy-mode)
  (diminish 'ivy-mode)
  (diminish 'yas-minor-mode)
  (diminish 'smartparens-mode)
  (diminish 'eldoc-mode)
  (diminish 'projectile-mode)
  (diminish 'undo-tree-mode)
  (diminish 'company-mode)
  (diminish 'outline-minor-mode)
  (diminish 'evil-snipe-mode)
  (diminish 'evil-snipe-local-mode)
  (diminish 'editorconfig-mode)
  (diminish 'evil-mc-mode)
  (diminish 'ws-butler-mode)
  (diminish 'evil-escape-mode)
  (diminish 'doom-big-font-mode)
  (diminish 'which-key-mode)
  (diminish 'persp-mode)
  (diminish 'evil-goggles-mode)
  (diminish 'evil-commentary-mode))

(after! ivy
  (defun counsel-ag-thing-at-point ()
    (interactive)
    (counsel-ag (thing-at-point 'symbol)))

  (defun swiper-thing-at-point ()
    (interactive)
    (swiper (thing-at-point 'symbol))))

(after! js2-mode
  (set-company-backend! 'js2-mode
    'company-dabbrev-code)
  (setq js2-basic-offset 2)
  (setq js2-ignored-warnings
        '(
          "msg.no.semi.stmt"
          "msg.missing.semi"
          "msg.no.semi.for"
          "msg.no.semi.for.cond"
          "msg.no.semi.for.cond"))
  (add-hook 'before-save-hook #'whitespace-cleanup))

(after! org
  (add-to-list 'org-capture-templates
               '("r" "Rant" entry
                 (file+headline "~/org/personal.org" "Rants")
                 "* Rant"
                 )
               )
  )

;; core
(add-hook 'before-save-hook #'whitespace-cleanup)

(setq
 company-idle-delay nil
 company-minimum-prefix-length 1)
