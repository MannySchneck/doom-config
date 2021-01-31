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
      (:when (featurep! :completion company)
       (:prefix "C-x")
         :i    "C-n" #'company-dabbrev)
      :desc "jira"                    :nv "oj" #'jira
      )

(map! :map (magit-mode-map)
    :gr "C-S-i"    #'magit-section-cycle-diffs)
