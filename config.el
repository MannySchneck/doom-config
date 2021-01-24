;;; .config/doom/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(add-hook 'text-mode-hook #'(lambda () (company-mode -1)))
(add-hook 'nxml-mode-hook #'(lambda ()
                              (setq-default indent-tabs-mode t)
                              (turn-off-auto-fill)))

(defun org-standup ()
  (interactive)
  (if (string-equal (+workspace-current-name) "org")
      (+workspace/other)
    (progn
      (+workspace-switch "org" t)
      (find-file (expand-file-name "~/org/notes.org")))))

(defun org-oncall ()
        (interactive)
	(find-file (expand-file-name "~/org/oncall.org")))

(defun org-time ()
	(interactive)
	(find-file (expand-file-name "~/org/time.org")))

(defun jira ()
  (interactive)
  (browse-url "https://cerebrae.atlassian.net/jira/your-work"))

(setq font-lock-comment-face "#AADDDD")


(setq projectile-project-search-path '("~/cbio/repo/service"))

