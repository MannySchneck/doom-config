;;; private/manny/init.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Source Code Pro" :size 12)
      doom-big-font (font-spec :family "Source Code Pro" :size 15))

(dolist (frame-setting
         '((fullscreen . maximized)
          (ns-transparent-titlebar . t)))
  (add-to-list 'default-frame-alist frame-setting))
