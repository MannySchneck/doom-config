;;; .config/doom/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(advice-add #'evil-scroll-down :around
            #'my-indicate-scroll-forward)

(advice-add #'evil-scroll-up :around
            #'my-indicate-scroll-backward)


(defun my-indicate-scroll-get-line (pos)
  (save-excursion
    (goto-char pos)
    (string-to-number (format-mode-line "%l"))))

(defun my-indicate-scroll (linep f args)
  (let ((linen (my-indicate-scroll-get-line linep))
        (pulse-delay 0.03))
    (save-excursion
      (goto-line linen)
      (pulse-momentary-highlight-one-line (point) 'highlight))
    (sit-for 0.03)
    (apply f args)))

(defun my-indicate-scroll-forward (f &rest args)
  (my-indicate-scroll (1- (window-end)) f args))

(defun my-indicate-scroll-backward (f &rest args)
  (my-indicate-scroll (window-start) f args))

(add-hook 'text-mode-hook #'(lambda () (company-mode -1)))
(add-hook 'nxml-mode-hook #'(lambda ()
															(setq-default indent-tabs-mode t)
															(turn-off-auto-fill)))

(defun org-standup ()
	(interactive)
	(find-file (expand-file-name "~/org/standup.org")))
