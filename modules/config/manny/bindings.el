;;; config/manny/bindings.el -*- lexical-binding: t; -*-

;;; config/default/+bindings.el -*- lexical-binding: t; -*-

;; This file defines a Spacemacs-esque keybinding scheme


;; <leader>
;;

(map! :leader
			:desc "Pomodoro"                :nv "d"  #'org-pomodoro
			:desc "Last project"            :nv "p`" #'+workspace/other
			:desc "org-notes quick"         :nv "on" #'org-standup
			:desc "org-oncall quick"        :nv "oo" #'org-oncall
			)
