;;; .config/doom/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-hook 'text-mode-hook #'(lambda () (company-mode -1)))
(add-hook 'nxml-mode-hook #'(lambda ()
															(setq-default indent-tabs-mode t)
															(turn-off-auto-fill)))

(defun org-standup ()
	(interactive)
	(find-file (expand-file-name "~/org/notes.org")))
(defun org-oncall ()
	(interactive)
	(find-file (expand-file-name "~/org/oncall.org")))

(defun org-time ()
	(interactive)
	(find-file (expand-file-name "~/org/time.org")))


(setq font-lock-comment-face "#AADDDD")
