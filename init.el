;; Register Alt-TAB
(w32-register-hot-key [M-tab])

  ;; (server-start) 
  (setq inhibit-startup-message t)

  ;; WINDOW
  (scroll-bar-mode -1) ;show scroll bars
  (set-fringe-mode 0) ;added window border
  (menu-bar-mode -1) ; top menu bar
  (tool-bar-mode -1)
  ;; (tooltip mode -1)

  (setq visible-bell t)

  ;; Scroll
  ;; (pixel-scroll-precision-mode)

  ;; Line Numbers
  (global-display-line-numbers-mode 0)
  (menu-bar--display-line-numbers-mode-relative)
  ;; (display-line-numbers-type 'relative)

  ;; Line Highlight
  (global-hl-line-mode 1)
  (set-face-background hl-line-face "#716969")

  ;; History

  (setq history-length 25)
  (savehist-mode 1)

  (setq recentf-max-saved-items 25)
  (recentf-mode 1)

  ;; Auto update buffers
  (global-auto-revert-mode)

  ;; Frame Parameters

  ;; (set-frame-parameter nil 'internal-border-width 20)
  (set-frame-parameter (selected-frame) 'alpha '(85 85))

  (add-to-list 'default-frame-alist '(internal-border-width . 20))
  (add-to-list 'default-frame-alist '(alpha-background  . 70))

  ;; (add-to-list 'default-frame-alist '(width  . 100))
  ;; (add-to-list 'default-frame-alist '(height . 40))

  ;;  (set-language-environment 'utf-8)
  ;;  (set-default-coding-systems 'utf-8)

;; (setq default-directory (getenv "DRIVE_D"))
(defvar my/DRIVE_D "d:/")
(defvar my/DRIVE_C "c:/")
(defvar my/WORK_KROENER_FODLER "d:/office")
(defvar my/HOME_KROENER_FOLDER "d:/work/office")

(defvar my/org-agenda-files (list (expand-file-name "notebooks/org/Tasks.org" my/DRIVE_D)
                                  (expand-file-name "notebooks/org/Meetings.org" my/DRIVE_D)
                                  (expand-file-name "D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org" my/DRIVE_D)))

(defvar my/org-dir-files  (list (expand-file-name "notebooks/org" my/DRIVE_D)))

;; (setq my-org-capture-template-target "/mnt/d/notebooks/DemacsNotes/org/Capture.org")
;; (defvar my/backup-directory "d:/notebooks/org/.data/backups/")
;; (defvar my/org-templates "d:/notebooks/org/.templates")
(defvar my/bookmarks (expand-file-name "notebooks/org/.data/win_bookmarks" my/DRIVE_D))
(defvar my/org-id-locations-file (expand-file-name "notebooks/org/.data/.win_org-id-locations" my/DRIVE_D))
(defvar my/trash-directory "~/.config/emacs/tmp/trash")

;; Font Settings
 ;; (add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-20"))

 ;; (set-face-attribute 'default nil :font "Verdana" :height 160)
 ;; (set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 160)
 ;; (set-face-attribute 'default nil :font "3270 Nerd Font" :height 180)
 (set-face-attribute 'default nil :font "Iosevka Term Curly" :height 180)

 ;; Theme Settings
 (setq modus-themes-region'(bg-only))
 (setq modus-themes-mode-line '(accented borderless padded))
 (setq modus-themes-org-blocks 'gray-background)
 (load-theme 'modus-vivendi t)

;; Icons
(use-package all-the-icons
:if (display-graphic-p))

;; (setq display-buffer-base-action
;; '((display-buffer-reuse-window
;;    display-buffer-reuse-mode-window
;;    display-buffer-same-window
;;    display-buffer-in-previous-window)))

;; TANGLE
(require 'package)

;; Package Sources
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Default Browser
(setq browse-url-browser-function 'browse-url-generic       browse-url-generic-program "c:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe")

;; Default Apps
(setq org-file-apps
      '(("\\.docx\\'" . default)
        ("\\.mm\\'" . default)
        ("\\.x?html?\\'" . default)
        ("\\.pdf\\'" . default)
        (auto-mode . emacs)))

(setq frame-title-format
       (list (format "%s %%S: %%j " (system-name))
             '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; (global-set-key [C-f1] 'show-file-name) ; Or any other key you want

(defun tmi/org-mode-setup ()
  (org-indent-mode)
  (setq evil-auto-indent t))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook (org-mode . tmi/org-mode-setup)
  :config

  (setq org-fontify-todo-headline t)
  (setq org-fontify-done-headline t)

  (setq org-insert-heading-respect-content t)
  (setq org-directory my/org-dir-files) ;;Default location of Org files
  (setq org-agenda-files my/org-agenda-files) ;;org agenda searches in this file or dir for todo items
  (setq org-ellipsis "…")
  (setq org-return-follows-link t)
  (setq org-log-done 'time) ;; timestamp on done
  (setq org-log-into-drawer t)
  (setq org-startup-folded t)

  ;; Setup org-id

  (require 'org-id)
  (setq org-id-link-to-org-use-id t) ;; (org-id-method) 
  (setq org-id-locations-file my/org-id-locations-file) ;; set where id's are stored
 ;; (org-id-update-id-locations '("d:\\notebooks\\org\\.data\\.win_org-id-locations"))

 ;; Set Faces

  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 0.9))))
   '(org-block ((t (:family "Fira Code Mono"  :height 1.0))))
   )

  ;; Org Capture Templates

  (setq org-capture-templates
        `(("t" "Tasks" entry (file+headline "d:/notebooks/org/Tasks.org" "Inbox")
           (file "d:/notebooks/org/.templates/Task_Template.org")
           :prepend t
           :jump-to-captured t
           :empty-lines-after 1
           :empty-lines-before 1
           )

          ("m" "Meeting" entry (file+headline "d:/notebooks/org/Meetings.org" "Meeting Notes")
           (file "d:/notebooks/org/.templates/Meeting_Template.org")
           :prepend t
           :jump-to-captured t
           :empty-lines-after 1
           :empty-lines-before 1
           :time-prompt 1
           )

          ("j" "Journal Log" plain (file+function "d:/notebooks/org/Journal.org"
                                                  (lambda ()
                                                    (org-datetree-find-date-create
                                                     (org-date-to-gregorian (org-today)) t)
                                                (re-search-forward "^\\*.+ Log.+]" nil t)))
           (file "d:/notebooks/org/.templates/Journal_Template.org")
           :prepend nil
           :jump-to-captured nil
           :empty-lines-before 1
           :empty-lines-after 1
           )

          ("J" "Journal Outline" entry (file+olp+datetree "d:/notebooks/org/Journal.org" "Journal")
           (file "d:/notebooks/org/.templates/Journal_Outline_Template.org")
           :prepend nil
           :jump-to-captured t
           :empty-lines-before 0
           :empty-lines-after 0
           )
          )
        ;; Org global TODO States
        ;; (setq org-todo-keywords
        ;;	'((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
        ))


;; Disable Line Number in Org mode
(defun my-display-numbers-hook ()
  (display-line-numbers-mode 0))

(add-hook 'org-mode-hook 'my-display-numbers-hook)

;; Org-Mode Custom Commands

(defun my/org-unschedule ()
  (interactive)
  (let ((current-prefix-arg '(4))) ;; emulate C-u
    (call-interactively 'org-schedule))) ;; invoke align-regexp interactivel

(defun my/capture-without-id-at-point()
  (interactive)
  (let ((org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))
    (org-capture nil)
    ))

(defun my/journal-capture-without-id-at-point()
  (interactive)
  (let ((org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))
    (org-capture nil "j")
    ))

(defun my/journal-outline-capture-without-id-at-point()
  (interactive)
  (let ((org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))
    (org-capture nil "J")
    ))

;; (defun my/capture-journal-without-id()
;;   (org-capture nil))
;; Org Refile

(setq org-refile-targets
      (quote(("d:/notebooks/org/Tasks.org" :maxlevel . 1)
             ("d:/notebooks/org/Meetings.org" :maxlevel . 1)
             ("d:/notebooks/org/org_capture.org" :maxlevel . 1))))

(setq org-refile-use-outline-path nil)
(setq org-refile-allow-creating-parent-nodes t)
(setq org-outline-path-complete-in-steps nil)

;; Org-TODO

(setq org-todo-keyword-faces
      '(
        ("ACT" . (:foreground "#cd5c60" :weight bold))
        ("WAIT" . (:foreground "yellow"))
        ("READ" . (:foreground))

        ("TODO" . (:foreground "red"))
        ("Next" . (:foreground "orange"))
        ("DONE" . (:foreground "green"))
        ("CANCELED" . (:foreground "grey"))
        ("HOLD" . (:foreground "yellow"))

        ("Initiation" . (:background "#118ab2" :foreground "black"))
        ("Planning" . (:background "#ffd166" :foreground "black"))
        ("Execution&Monitoring" . (:background "#ef476f" :foreground "#black" :bold t :weight bold :box (:line-width 2 :style released-button)))
        ("Closing" . (:background "#718355" :foreground "black"))
        ("Done" . (:background "#06d6a0" :foreground "black"))
        ("Canceled" . (:background "grey" :foreground "black"))
        ("Hold" . (:background "lightgrey" :foreground "black"))

        ("WIP" . (:foreground "red" :weight italic :box ))
        ("GEPRÜFT" . (:foreground "yellow"))
        ("FREI" . (:foreground "green"))
        ("INTERN" . (:foreground "red"))
        ("RÜCKSPRACHE" . (:foreground "yellow"))

        ("DELIGATED" . (:foreground "lightblue"))
        ("DONE" . (:foreground))
        ("CANCELED" . (:foreground "blue"))
        ))

; (setq org-agenda-prefix-format '((agenda  . " %i %-12:c %?-12t %-12s")
;                                  (todo . "%i %-22b %s")))

;;  (setq org-agenda-ignore-properties '(effort appt stats category))
;;  (setq org-agenda-todo-ignore-scheduled nil)
;;  (setq org-agenda-todo-list-sublevels t)
;;  (setq org-agenda-use-tag-inheritance nil)
;;  (setq org-agenda-window-setup 'reorganize-frame) 
;;  (setq org-agenda-restore-windows-after-quit t)

;;  (setq org-agenda-custom-commands
;;        '(
;;          ("D" "Day"
;;           (
;;            (agenda ""
;;                    ((org-agenda-block-separator nil)
;;                     (org-agenda-start-day "-1d")
;;                     (org-agenda-span 1)
;;                     (org-agenda-repeating-timestamp-show-all t)
;;                     (org-agenda-entry-types '(:timestamp :sexp :scheduled))
;;                     (org-agenda-overriding-header "\n* Yesterday *\n")))
;;            (agenda ""
;;                    ((org-agenda-block-separator nil)
;;                     (org-agenda-span 1)
;;                     (org-agenda-repeating-timestamp-show-all t)
;;                     (org-agenda-entry-types '(:timestamp :sexp :scheduled))
;;                     (org-agenda-overriding-header "\n* Today *\n")))
;;            (agenda ""
;;                    ((org-agenda-block-separator nil)
;;                     (org-agenda-entry-types '(:deadline))
;;                     (org-deadline-warning-days 7)
;;                     (org-agenda-overriding-header "\n* Deadlines *\n")))
;;            (agenda ""
;;                    ((org-agenda-block-separator nil)
;;                     (org-agenda-start-day "+1d")
;;                     (org-agenda-span 2)
;;                     (org-agenda-repeating-timestamp-show-all t)
;;                     (org-agenda-entry-types '(:timestamp :sexp :scheduled))
;;                     (org-agenda-overriding-header "\n* Next *\n")))
;;            (todo "WAIT"
;;                  ((org-agenda-overriding-header "* Waiting on *\n")))
;;            (todo "ACT"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Open Tasks *\n")))
;;            (todo "DELIGATED"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Deligated *\n")))
;;            (todo "Next"
;;                  ((org-agenda-overriding-header "* Project NEXT *\n")))
;;            (todo "Execution&Monitoring"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Active *\n")))
;;            (todo "Planning"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Plan *\n")))
;;            (todo "Initiation"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Init *\n")))
;;            ))

;;          ("W" "Week"
;;           (
;;            (agenda ""
;;                    ((org-agenda-block-separator nil)
;;                     (org-agenda-span 14)
;;                     (org-agenda-start-on-weekday 0)
;;                     (org-agenda-repeating-timestamp-show-all t)
;;                     (org-agenda-entry-types '(:timestamp :sexp :scheduled :deadline))
;;                     (org-agenda-overriding-header "\n* 14D *\n")))
;;            ))
;;          ("M" "Month"
;;           (
;;            (agenda ""
;;                    ((org-agenda-block-separator nil)
;;                     (org-agenda-span 31)
;;                     (org-agenda-start-on-weekday 0)
;;                     (org-agenda-repeating-timestamp-show-all t)
;;                     (org-agenda-entry-types '(:timestamp :sexp :scheduled :deadline))
;;                     (org-agenda-overriding-header "\n* Month *\n")))
;;            (todo "WAIT"
;;                  ((org-agenda-overriding-header "* Waiting on *\n")))
;;            (todo "ACT"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Open Tasks *\n")))
;;            (todo "DELIGATED"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Deligated *\n")))
;;            (todo "Next"
;;                  ((org-agenda-overriding-header "* Project NEXT *\n")))
;;            (todo "Execution&Monitoring"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Active *\n")))
;;            (todo "Planning"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Plan *\n")))
;;            (todo "Initiation"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
;;                   (org-agenda-overriding-header "\n* Init *\n")))
;;            ))

;;          ("P" "Project Overview"
;;           (
;;            (agenda ""
;;                    ((org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org"))
;;                     (org-agenda-span 30)
;;                     (org-deadline-warning-days 30)
;;                     (org-agenda-overriding-header "\n* Project Agenda *\n")))
;;            (todo "Next"
;;                  ((org-agenda-overriding-header "* Next Step *\n")))
;;            (todo "Execution&Monitoring"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'regexp ":exclude:"))
;;                   (org-agenda-overriding-header "\n* Active *\n")))
;;            (todo "Planning"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'regexp ":exclude:"))
;;                   (org-agenda-overriding-header "\n* Planning *\n")))
;;            (todo "Initiation"
;;                  ((org-agenda-block-separator nil)
;;                   (org-agenda-skip-function '(org-agenda-skip-entry-if 'regexp ":exclude:"))
;;                   (org-agenda-overriding-header "\n* Ini *\n")))
;;            ))
;;          ))

;;  (defun my/org-agenda-inactive ()
;;    (interactive)
;;    (let ((org-agenda-include-inactive-timestamps t))
;;      (org-agenda)))

(use-package org-super-agenda
      :ensure t)
    (require 'org-super-agenda)
    (org-super-agenda-mode t)
(setq org-super-agenda-keep-order t) 
                                            ; (org-agenda nil "a")
    (setq org-super-agenda-header-separator "\n")

    (setq org-agenda-custom-commands
          '(

            ("d" "Day"
             (
              (agenda ""
                      ((org-agenda-block-separator nil)
                       (org-agenda-span 'day)
                       (org-agenda-entry-types '(:deadline))
                       (org-agenda-prefix-format '((agenda . " %i %?-12t %-12s")))
                       (org-deadline-warning-days 30)
                       (org-agenda-overriding-header "\n* Deadlines *\n")))

              (agenda ""
                      ((org-agenda-block-separator nil)
                       (org-agenda-span 1)
                       (org-agenda-repeating-timestamp-show-all t)
                       (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                       (org-agenda-prefix-format '((agenda . " %i %?-12t %-12s")))
                       (org-agenda-overriding-header "\n* Today *\n")
                       (org-super-agenda-groups
                        '((:name "Tasks"
                                 :todo "ACT"
                                 :order 1)
                          (:name "Waiting on"
                                 :todo "WAIT"
                                 :order 1)
                          (:name "Other"
                                 :todo t
                                 :order 2)))))

              (agenda ""
                      ((org-agenda-block-separator nil)
                       (org-agenda-start-day "+1d")
                       (org-agenda-span 2)
                       (org-agenda-repeating-timestamp-show-all t)
                       (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                       (org-agenda-prefix-format '((agenda . " %i %?-12t %-12s")))
                       (org-agenda-overriding-header "\n* Upcoming *\n")))

              (todo ""
                    ((org-agenda-overriding-header "* Open Task List *\n")
                     (org-agenda-prefix-format '((todo . "%-12(let ((scheduled (org-get-scheduled-time (point)))) (if scheduled (format-time-string \"%d.%m.%Y\" scheduled) \"\")) %i ")))
                     (org-agenda-files '("D:/notebooks/org/Tasks.org" "D:/notebooks/org/Meetings.org"))
                     (org-super-agenda-groups
                      '((:name ""
                               :todo "ACT"
                               :order 1)
                        (:name ""
                               :todo "WAIT"
                               :order 1)
                        (:name ""
                               :todo "DELIGATED"
                               :order 1)
                        (:name "Meeting"
                               :file-path ("D:/notebooks/org/Meetings.org")
                               :order 2)
                        (:name "Other"
                               :todo t
                               :order 2)))))
              ))

            ("P" "Project Task List"
             (
              (todo "" ((org-agenda-overriding-header "Project Task List")
                        (org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org"))
                        (org-agenda-prefix-format '((todo . "%-12(let ((scheduled (org-get-scheduled-time (point)))) (if scheduled (format-time-string \"%d.%m.%Y\" scheduled) \"\")) %i ")))

                        (org-super-agenda-groups
                         '(
                           ;; (:auto-outline-path t)
                           ;; (:auto-property "Project")
                           ;; (:auto-tags t)
                           ;; (:auto-category t)
                           ;; (:name "Client Projects"
                           ;;        :tag "Client"
                           ;;        :order 1)
                           ;; (:name "Research Projects"
                           ;;        :tag "Research"
                           ;;        :order 2)
                           ;; (:name "Marketing Projects"
                           ;;        :tag "Marketing"
                           ;;        :order 3)
                           ;; (:name "Italy"
                           ;;        :tag "Italy"
                           ;;        :order 4)
                           (:discard (:todo ("WIP" "INTERN" "RÜCKSPRACHE" "GEPRÜFT")))
                           (:discard (:tag ("Exclude")))
                           )))))
             nil
             ("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/Project_Task_List.html"))

            ("z" "Project Agenda Overview"
             (
              (agenda ""
                      ((org-agenda-block-separator nil)
                       (org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org"))
                       (org-agenda-prefix-format '(
                                                   (agenda . "%s %b  %?-2i %t")))
                       (org-agenda-entry-types '(:deadline))
                       (org-agenda-span 1)
                       (org-deadline-warning-days 60)
                       (org-agenda-overriding-header "\n* Deadlines *\n")))
              (agenda ""
                      ((org-agenda-overriding-header "Project Task List")
                       (org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org"))
                       (org-agenda-span 90)
                       (org-agenda-repeating-timestamp-show-all t)
                       (org-agenda-skip-scheduled-if-done nil)
                       (org-agenda-entry-types '(:timestamp :sexp :scheduled))
                       (org-agenda-include-diary nil)
                       (org-agenda-current-time-string "")
                       (org-agenda-time-grid '((daily) () "" ""))
                       (org-agenda-prefix-format '(
                                                   (agenda . "%b  %?-2i %t ")))
                       (org-super-agenda-groups
                        '(
                          ;; (:discard (:not (:todo ("Next" "TODO" "DONE"))))
                          ;; (:auto-outline-path t)
                          ;; (:auto-planning t)
                          ;; (:auto-property "Project")
                          ;; (:auto-tags t)
                          ;; (:auto-category t)
                          (:discard (:todo ("WIP" "INTERN" "RÜCKSPRACHE" "GEPRÜFT")))
                          (:discard (:tag ("Exclude")))
                          (:name " Overdue "  ; Optionally specify section name
                                 :scheduled past
                                 :face 'warning)
                          (:name ""  ; Optionally specify section name
                                 :scheduled future
                                 :face 'warning))))))
             nil
             ("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/Project_Agenda_Overview.html"))
            ))

(use-package org-agenda-property
  :ensure t)
(setq org-agenda-property-list '("assigned" "assets" "condition"))

(use-package org-download
  :ensure t)
(setq org-download-image-org-width 20)

(use-package org-modern
    :ensure t)

  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
;; force agenda to start at top
(add-hook 'org-agenda-finalize-hook #'org-agenda-find-same-or-today-or-agenda 90)
  (setq org-auto-align-tags nil)
  (setq org-hide-emphasis-markers t)

  (setq org-pretty-entities t)

  (setq org-tags-column 0)
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)

  (setq line-spacing 0.3)

  (setq org-modern-fold-stars 
   '(("▶" . "▼")
    ("▷" . "▽")
    ("⯈" . "⯆")
    ("▹" . "▿")
    ("▸" . "▾")))

  (global-org-modern-mode) ;; maybe redundant

;; (use-package org-bullets
;;   :hook (org-mode . org-bullets-mode)
;;   :custom
;;   (org-bullets-bullet-list '("*1" "*2" "*3" "*4" "*5" "*6")))

(setq bibtex-completion-pdf-field "file")

;;   (setq org-cite-global-bibliography
;;         '("d:/notebooks/org/bibliography/mylib.bib"))

;; (use-package zotxt)
;; (use-package org-ref)

;; (setq bibtex-completion-bibliography '("d:/notebooks/org/bibliography/references.bib"
;;                                        "d:/notebooks/org/bibliography/mylib.bib"
;;                                        "d:/notebooks/org/bibliography/master.bib"
;;                                        "d:/notebooks/org/bibliography/archive.bib")
;;       bibtex-completion-library-path '("d:/notebooks/org/bibliography/bibtex-pdfs/")
;;       bibtex-completion-notes-path "d:/notebooks/org/bibliography/notes/"
;;       bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

;;       bibtex-completion-additional-search-fields '(keywords)
;;       bibtex-completion-display-formats
;;       '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
;;         (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
;;         (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;;         (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
;;         (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}")))

(use-package org-noter
  :after (:any org pdf-view)
  :config
  (setq
   ;; The WM can handle splits
   org-noter-notes-window-location 'horizontal-split
   ;; Please stop opening frames
   org-noter-always-create-frame nil
   ;; I want to see the whole file
   org-noter-hide-other nil

   org-noter-default-notes-file-names '("refnotes.org")
   ;; Everything is relative to the main notes file
   org-noter-notes-search-path  '("d:/notebooks/org/bibliography/notes/")
   org-noter-separate-notes-from-heading t))

(use-package org-transclusion
    :after org)

  (add-hook 'org-mode-hook #'org-transclusion-mode)
(with-eval-after-load 'org-transclusion
  (define-fringe-bitmap 'org-transclusion-fringe-bitmap
    [17 34 68 136 68 34 17]
    nil nil 'center))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-startup-indented t)
 '(org-transclusion-extensions
   '(org-transclusion-src-lines org-transclusion-font-lock org-transclusion-indent-mode))
 '(package-selected-packages
   '(yasnippet which-key vertico pdf-tools org-transclusion org-super-agenda org-noter org-modern org-download org-agenda-property orderless ob-mermaid nov marginalia magit htmlize gnuplot-mode gnuplot general evil-collection djvu citar-embark auctex all-the-icons)))

    (set-face-attribute
     'org-transclusion-fringe nil
     :foreground "green"
     :background "green")

;; (fido-vertical-mode)

;; Vertico

(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)
  ;; Show more candidates
  ;; (setq vertico-count 20)
  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)
  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  ) 
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(setq enable-recursive-minibuffers t) ;;enables commands like M-x when in minibuffer

;; Orderless

(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  ;; The :init section is always executed.
  :init
  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1)
;;   :custom (doom-modeline-height 15))

;; (use-package helpful
;;  :custom
;;  (counsel-describe-function-function #'helpful-callable)
;;  (counsel-describe-variable-function #'helpful-variable)
;;  :bind
;;  ([remap describe-function] . counsel-describe-function)
;;  ([remap describe-command] . helpful-command)
;;  ([remap describe-variable] . counsel-describe-variable)
;;  ([remap describe-key] . helpful-key))

(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 0.05))

(use-package tex
  :ensure auctex)

(use-package pdf-tools
  :ensure t)

(pdf-tools-install)  ; Standard activation command
;; (pdf-loader-install) ; On demand loading, leads to faster startup time
;;  (setq pdf-view-use-scaling nil)

(use-package evil
  :init
  (setq evil-want-integration t)
  ;;    (setq evil-want-C-i-jump nil) ;; disables Jumplist binding so you can TAB in Normal mode in Org mode 
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired org vertico ibuffer))
  (evil-collection-init))

;; (use-package citar
;;   :no-require
;;   :custom
;;   (org-cite-global-bibliography '("d:/notebooks/org/bibliography/mylib.bib"))
;;   (org-cite-insert-processor 'citar)
;;   (org-cite-follow-processor 'citar)
;;   (org-cite-activate-processor 'citar)
;;   (citar-at-point-function 'embark-dwim)
;;   (citar-bibliography org-cite-global-bibliography))

(use-package citar
  :custom
  (org-cite-global-bibliography '("d:/notebooks/org/bibliography/mylib.bib"))
  (citar-bibliography '("d:/notebooks/org/bibliography/mylib.bib"))
  (org-cite-insert-processor 'citar)
  (org-cite-follow-processor 'citar)
  (org-cite-activate-processor 'citar))

(setq citar-notes-paths '("d:/notebooks/org/bibliography/notes"))  ;; using Org Noter 

;; (setq citar-citeproc-csl-style )

(setq citar-templates
      '((main . "${author editor:30%sn}     ${date year issued:4}     ${title:48}")
        (suffix . "          ${=key= id:15}    ${=type=:12}    ${tags keywords:*}")
        (preview . "${author editor:%etal} (${year issued date}) ${title}, ${journal journaltitle publisher container-title collection-title}.\n")
        (note . "Notes on ${author editor:%etal}, ${title}")))

;; (use-package async)
;; (require 'doi-utils)

(setq citar-indicators
      (list citar-indicator-files ; plain text
            citar-indicator-notes)) ; icon

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(require 'icalendar)

(setq diary-file "d:/notebooks/org/cal.org")
(setq calendar-mark-diary-entries-flag t)
(add-to-list 'auto-mode-alist '("\\diary\\'" . diary-mode))
(setq diary-comment-start ";;")
(setq diary-comment-end "")
(setq org-agenda-include-diary t)
(add-hook 'diary-mode-hook 'real-auto-save-mode)
(add-hook 'diary-mode-hook #'abbrev-mode)

(use-package magit
  :ensure t)

(use-package ob-mermaid
  :ensure t)
;; (setq ob-mermaid-cli-path "~/mermaid/node_modules/.bin/mmdc")

(use-package htmlize
  :ensure t)

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file))
(setq delete-by-moving-to-trash t)
(setq trash-directory my/trash-directory)

(use-package yasnippet
   :config
   (setq yas-snippet-dirs '("D:/notebooks/org/.templates/yasnippets/"))
   (yas-global-mode 1))

(setq bookmark-default-file my/bookmarks)

;; (use-package python-mode
;; :ensure nil
;; :custom
;; (python-shell-interpreter "python3"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(use-package djvu
  :ensure t)

(use-package nov
  :ensure t)

(require 'flyspell)
(require 'ispell)
(setq-default ispell-program-name "C:/hunspell/bin/hunspell.exe")
(setq ispell-dictionary "en_GB,de_DE_frami")
(ispell-set-spellchecker-params)
(ispell-hunspell-add-multi-dic "en_GB,de_DE_frami")
;; (setq ispell-local-dictionary-alist '(
;;                                       (nil
;;                                        "[[:alpha:]]"
;;                                        "[^[:alpha:]]"
;;                                        "[']"
;;                                        t
;;                                        ("-d" "en_US" "-p" "D:\\hunspell\\share\\hunspell\\personal.en")
;;                                        nil
;;                                        iso-8859-1)

;;                                       ("american"
;;                                        "[[:alpha:]]"
;;                                        "[^[:alpha:]]"
;;                                        "[']"
;;                                        t
;;                                        ("-d" "en_US" "-p" "D:\\hunspell\\share\\hunspell\\personal.en")
;;                                        nil
;;                                        iso-8859-1)
;;                                       ("deutsch"
;;                                        "[[:alpha:]ÄÖÜéäöüß]"
;;                                        "[^[:alpha:]ÄÖÜéäöüß]"
;;                                        "[']"
;;                                        t
;;                                        ("-d" "de_DE_frami" "-p" 
;;                                         "D:\\hunspell\\share\\hunspell\\personal.de")
;;                                        nil
;;                                        iso-8859-1)
;;                                       ))

;; (when (boundp 'ispell-hunspell-dictionary-alist)
;;   (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(keymap-global-unset "C-k") ; unset kill line

(use-package general
  :config
  (general-evil-setup)

  ;; set up 'SPC' as the global leader key
  (general-create-definer tmi/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix  "M-SPC") ;; access leader in insert mode

  (tmi/leader-keys
    ":" '(execute-extended-command :wk "M-x")

    "f" '(:ignore t :wk "Files")
    "f f" '(find-file :wk "Find file")
    "f c" '((lambda () (interactive)
              (find-file "~/.config/emacs/config.org")) 
            :wk "Open config.org")
    "f m" '((lambda () (interactive)
              (find-file "d:/notebooks/org/Meetings.org")) 
            :wk "Open Meetings.org")
    "f j" '((lambda () (interactive)
              (find-file "d:/notebooks/org/Journal.org")) 
            :wk "Open Journal.org")
    "f t" '((lambda () (interactive)
              (find-file "d:/notebooks/org/Tasks.org")) 
            :wk "Open Tasks.org")  
    "f r" '(recentf-open :wk "Recent Files")

    "TAB TAB" '(comment-line :wk "Comment lines")

    "B" '(:ignore t :wk "Bookmarks")
    "B b" '(list-bookmarks :wk "List bookmarks")
    "B s" '(bookmark-set :wk "Set bookmarks")
    "B S" '(bookmark-save :wk "Save bookmarks")

    "b" '(:ignore t :wk "Buffer")
    "b b" '(switch-to-buffer :wk "switch buffer")
    "b i" '(ibuffer :wk "ibuffer")
    "b p" '(previous-buffer :wk "<- buffer")
    "b n" '(next-buffer :wk "buffer ->")
    "b k" '(kill-buffer :wk "kill buffer")

    "r" '(:ignore t :wk "Run")
    "r o" '(app/run-outlook :wk "Outlook")
    "r c" '(app/run-calendar :wk "gCalendar")
    "r s" '(app/org-screenshot :wk "snipping tool")


    "u" '(universal-argument :wk "u-arg")
    "q" '(exit-minibuffer :wk "Exit minib")

    "h" '(:ignore t :wk "help")
    "h r r" '((lambda () (interactive)
                (load-file "~/.config/emacs/init.el"))
              :wk "Reload emacs config")

    "d" '(:ignore t :wk "Dired")
    "d d" '(dired :wk "Dired")
    "d D" '(dired-other-window :wk "Dired other Window")

    "w" '(:ignore t :wk "window")
    "w w"'(other-window :wk "switch window")
    "w q"'(quit-window :wk "close window")
    "w o" '(delete-other-windows :wk "delete other window")
    "w v" '(split-window-right :wk "split vertical")

    "E" '(:ignore t :wk "eval")
    "E r" '(eval-region :wk "eval-R")
    "E b" '(eval-buffer :wk "eval-B")

    "e" '(:ignore t :wk "Embark")
    "e e" '(embark-act :wk "Act")
    "e d" '(embark-dwim :wk "Dwim")

    "o" '(:ignore t :wk "org")
    "o a" '(org-agenda :wk "Agenda")
    "o A" '(my/org-agenda-inactive :wk "Agenda TS")
    "o w" '(org-store-agenda-views :wk "Write Agenda htmls")
    "o c" '(org-capture :wk "Capture")
    "o C" '(my/capture-without-id-at-point :wk "Capture without ID")
    "o d" '(org-deadline :wk "Deadline")
    "o i" '(org-insert-last-stored-link :wk "Insert Link")
    "o I" '(org-insert-link :wk "Insert selected Link")
    "o j" '(my/journal-capture-without-id-at-point :wk "Journal Entry")
    "o J" '(my/journal-outline-capture-without-id-at-point :wk "Journal Outline")
    "o l" '(org-store-link :wk "Store Link")
    "o n" '(org-add-note :wk "add note to current entry")
    "o o" '(org-open-at-point :wk "open link")
    "o s" '(org-schedule :wk "Schedule")
    "o t" '(org-set-tags-command :wk "Tags set/edit")
    "o u" '(my/org-unschedule :wk "Unschedule")
    "o z" '(org-cite-insert :wk "Cite")
    "o TAB" '(complete-symbol :wk "Completion")


    "s" '(:ignore t :wk "snippets")
    "s s" '(yas-insert-snippet :wk "Insert Snippet")
    "s i" '(org-insert-structure-template :wk "Insert Block")
    "s n" '(yas-new-snippet :wk "New Snippet")

    ;; "o k" '(my/org-todo-insert-comment :wk "Comment TODO item")
    ;;"o ," '(org-cycle-agenda-files :wk "cycle agenda files")

    )
  )

(setq backup-directory-alist
      '((".*" . "~/.config/emacs/tmp/backups/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.config/emacs/tmp/backups/" t)))

(defun my/clip-path-to-current-location ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (kill-new (buffer-file-name)))

(defun my/insert-directory-files-as-links (directory)
  "Insert links for all files in DIRECTORY."
  (interactive "sEnter directory path: ")
  (dolist (file (directory-files directory))
    (when (not (string-prefix-p "." file)) ; Exclude hidden files
      (insert (format "[[file:%s][%s]]\n" (expand-file-name file directory) file)))))

;; Usage: (insert-directory-files-as-links \"~/my_directory\")

(defun app/run-outlook ()
  "Run Outlook"
  (interactive)
  (call-process "C:\\Program Files\\Microsoft Office\\root\\Office16\\OUTLOOK.EXE"))

(defun app/run-calendar ()
  "Open the Calendar (MS Edge Proxy)"
  (interactive)
  (call-process "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge_proxy.exe"
                nil ; No buffer for output
                nil ; No buffer for error messages
                nil ; Don't display process
                "--profile-directory=Default"
                "--app-id=kjbdgfilnfhdoflbpgamdcdgpehopbep"
                "--app-url=https://calendar.google.com/calendar/r"
                "--app-launch-source=4"))

(defun app/org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
        same directory as the org-buffer and insert a link to this file."  
  (interactive)
  (setq filename
        (concat
         (make-temp-name
          (concat (buffer-file-name)
                  "_"
                  (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
  (shell-command "snippingtool /clip")
  (shell-command (concat "powershell -command \"Add-Type -AssemblyName System.Windows.Forms;if ($([System.Windows.Forms.Clipboard]::ContainsImage())) {$image = [System.Windows.Forms.Clipboard]::GetImage();[System.Drawing.Bitmap]$image.Save('" filename "',[System.Drawing.Imaging.ImageFormat]::Png); Write-Output 'clipboard content saved as file'} else {Write-Output 'clipboard does not contain image data'}\""))
  (insert (concat "[[file:" filename "]]"))
  (org-display-inline-images))


(defun my/export ()
  (interactive)
  (setq inhibit-read-only t)
  (org-export-dispatch)
  (setq inhibit-read-only nil))

(defun my/org-babel-tangle-config ()
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))
    )
  ) 

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'my/org-babel-tangle-config)))

(defun my/push-to-drop ()
  (interactive)

  (when (string-equal (buffer-file-name) "d:/notebooks/org/Tasks.org")
    ;; Dynamic scoping to the rescue
    (write-region nil nil "d:/notebooks/Dropbox/org/Tasks_wr.org" nil nil nil nil))

  (when (string-equal (buffer-file-name) "d:/notebooks/org/Journal.org")
    ;; Dynamic scoping to the rescue
    (write-region nil nil "d:/notebooks/Dropbox/org/Journal_wr.org" nil nil nil nil)))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'my/push-to-drop)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:family "Fira Code Mono" :height 1.0))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 0.9)))))
