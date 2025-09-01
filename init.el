;; Register Alt-TAB
(w32-register-hot-key [M-tab])

;; (server-start) 
(setq inhibit-startup-message t)

;; WINDOW
(scroll-bar-mode -1) ;show scroll bars
(set-fringe-mode 0) ;added window border
(menu-bar-mode -1) ; top menu bar
(tool-bar-mode -1)
(setq visible-bell t)
;; (tooltip-mode -1)

;; Scroll
(pixel-scroll-precision-mode)

;; Line Numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;;  (menu-bar--display-line-numbers-mode-relative)

;; Line Highlight
(global-hl-line-mode 1)
;; (set-face-background hl-line-face "#716969")
(set-face-background 'hl-line (face-background 'hl-line nil t))

;; History

(setq history-length 30)
(savehist-mode 1)

(setq recentf-max-saved-items 30)
(recentf-mode 1)

;; Auto update buffers
(global-auto-revert-mode)

;; Ensure Emacs starts in fullscreen mode
(add-hook 'window-setup-hook #'toggle-frame-maximized)

;; Frame Parameters
(set-frame-parameter nil 'internal-border-width 10)
(set-frame-parameter (selected-frame) 'alpha '(75 75))

;; (add-to-list 'default-frame-alist '(internal-border-width . 20))
;; (add-to-list 'default-frame-alist '(alpha-background  . 10))

;; (add-to-list 'default-frame-alist '(width  . 100))
;; (add-to-list 'default-frame-alist '(height . 40))

;; Set the coding system to UTF-8
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defvar my/system-name (system-name))

  (defvar my/system-type system-type)

  ;; (defvar my/BASE_PATH "d:/")
  ;; (defvar my/SYSTEM_BASE_PATH "c:/")
  ;; (defvar my/WORK_KROENER_FODLER "d:/office")
  ;; (defvar my/ORG_BASE_PATH  (expand-file-name "notebooks/org" my/BASE_PATH))
  ;; (defvar my/ORG_ID-LOCATIONS-FILE (expand-file-name ".data/.win_org-id-locations" my/ORG_BASE_PATH))
  ;; (defvar my/BOOKMARKS (expand-file-name ".data/win_bookmarks" my/ORG_BASE_PATH))
  ;; (defvar my/ORG-AGENDA_FILES (list (expand-file-name "tasks.org" my/ORG_BASE_PATH)
  ;;                                   (expand-file-name "meetings.org" my/ORG_BASE_PATH)
  ;;                                   (expand-file-name "OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org" my/WORK_KROENER_FODLER)))
  ;; (defvar my/trash-directory "~/.config/emacs/tmp/trash")

;; -----------------------------
;; Base paths per system
;; -----------------------------
(cond
 ;; Desktop Windows
 ((string-equal my/system-name "DT-001-W11")
  (defvar my/BASE_PATH "d:/") ;; REFERS TO THE BASE DRIVE WHERE ORG FILES ARE
  (defvar my/SYSTEM_BASE_PATH "c:/") ;; REFERS to DRIVE WITH OS C:/
  (defvar my/WORK_KROENER_FODLER "d:/office"))

 ;; Laptop Windows
 ((string-equal my/system-name "LT")
  (defvar my/BASE_PATH "d:/")
  (defvar my/SYSTEM_BASE_PATH "c:/")
  (defvar my/WORK_KROENER_FODLER "d:/office"))

 ;; Linux
 ;; ((eq my/system-type 'gnu/linux)
  ;; (defvar my/BASE_PATH (expand-file-name "~")) ;;HOME set this to the folder above -> /notebooks/org
  ;; (defvar my/SYSTEM_BASE_PATH "c:/")
  ;; (defvar my/WORK_KROENER_FODLER "d:/office")) ;; set this to the folder above -> /office
  ;; )

 ;; fallback
 (t
  (defvar my/BASE_PATH "d:/")
  (defvar my/SYSTEM_BASE_PATH "c:/")
  (defvar my/WORK_KROENER_FODLER "d:/office")))


  ;; -----------------------------
  ;; Org directories and files
  ;; -----------------------------
  (defvar my/ORG_BASE_PATH (expand-file-name "notebooks/org" my/BASE_PATH))
  (defvar my/ORG_ID-LOCATIONS-FILE (expand-file-name ".data/.win_org-id-locations" my/ORG_BASE_PATH))
  (defvar my/BOOKMARKS (expand-file-name ".data/win_bookmarks" my/ORG_BASE_PATH))
  (defvar my/ORG-AGENDA_FILES (list (expand-file-name "tasks.org" my/ORG_BASE_PATH)
                                    (expand-file-name "meetings.org" my/ORG_BASE_PATH)
                                    (expand-file-name "OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org" my/WORK_KROENER_FODLER)))
  (defvar my/trash-directory "~/.config/emacs/tmp/trash")

;; Font Settings

;; Set default font
(set-face-attribute 'default nil :font "FiraCode Nerd Font Reg" :height 180)

;; Customize faces for org-mode levels
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.4 :weight bold :foreground "#ff9e3b"))))  ;; Modus Vivendi Orange
 '(org-level-2 ((t (:inherit outline-2 :height 1.3 :weight bold :foreground "#3bd9ff"))))  ;; Modus Vivendi Cyan
 '(org-level-3 ((t (:inherit outline-3 :height 1.2 :weight bold :foreground "#8cdd00"))))  ;; Modus Vivendi Green
 '(org-level-4 ((t (:inherit outline-4 :height 1.1 :weight bold :foreground "#ff6262"))))  ;; Modus Vivendi Red
 '(org-level-5 ((t (:inherit outline-5 :height 1.0 :weight bold :foreground "#f1fa8c"))))  ;; Modus Vivendi Yellow

 ;; Customize faces for org-mode blocks
 '(org-block ((t (:family "FiraCode Nerd Font Mono Ret" :background "#0b0b0b" :foreground "#dcdcdc" :extend t))))  ;; Modus Vivendi Base00
 '(org-block-begin-line ((t (:background "#1e1e1e" :foreground "#a3a3a3" :extend t))))  ;; Modus Vivendi Base01
 '(org-block-end-line ((t (:background "#1e1e1e" :foreground "#a3a3a3" :extend t))))  ;; Modus Vivendi Base01

 ;; Customize faces for comments
 '(font-lock-comment-face ((t (:slant italic :foreground "#6272a4"))))  ;; Dracula Comment Color

 ;; Customize faces for strings
 '(font-lock-string-face ((t (:foreground "#98c379"))))  ;; Solarized Green

 ;; Customize faces for keywords
 '(font-lock-keyword-face ((t (:weight bold :foreground "#d73a49"))))  ;; GitHub Red

 ;; Customize faces for function names
 '(font-lock-function-name-face ((t (:weight bold :foreground "#61afef"))))  ;; Solarized Blue

 ;; Customize faces for variables
 '(font-lock-variable-name-face ((t (:foreground "#b58900"))))  ;; Solarized Yellow

 ;; Customize faces for constants
 '(font-lock-constant-face ((t (:foreground "#268bd2"))))  ;; Solarized Blue

 ;; Customize faces for types
 '(font-lock-type-face ((t (:foreground "#2aa198"))))  ;; Solarized Cyan
 )

;; Theme Settings
(setq modus-themes-region'(bg-only))
(setq modus-themes-mode-line '(accented borderless padded))
(setq modus-themes-org-blocks 'gray-background)
(load-theme 'modus-vivendi t)

;; Icons

(use-package all-the-icons
  :if (display-graphic-p))
;; :config (all-the-icons-install-fonts)

;; (setq display-buffer-base-action
;; '((display-buffer-reuse-window
;;    display-buffer-reuse-mode-window
;;    display-buffer-same-window
;;    display-buffer-in-previous-window)))

(require 'package)

;; Package Sources
(setq package-archives '(("melpa" . "https://melpa.org/packages/")("org" . "https://orgmode.org/elpa/")("elpa" . "https://elpa.gnu.org/packages/")))
(setq package-quickstart t)
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
    (setq org-directory my/ORG_BASE_PATH) ;;Default location of Org files
    (setq org-agenda-files my/ORG-AGENDA_FILES) ;;org agenda searches in this file or dir for todo items
    (setq org-ellipsis " ")
    (setq org-return-follows-link t)
    (setq org-log-done 'time) ;; timestamp on done
    (setq org-log-into-drawer t)
    (setq org-startup-folded t)

    ;; Setup org-id

    (require 'org-id)
    (setq org-id-link-to-org-use-id t) ;; (org-id-method) 
    (setq org-id-locations-file my/ORG_ID-LOCATIONS-FILE)) ;; set where id's are stored
    ;; (org-id-update-id-locations '("d:\\notebooks\\org\\.data\\.win_org-id-locations"))


    ;; Org Capture Templates

(setq org-capture-templates
      `(
        ("t" "Tasks" entry
         (file+headline ,(expand-file-name "tasks.org" my/ORG_BASE_PATH) "Inbox")
         (file ,(expand-file-name ".templates/Task_Template.org" my/ORG_BASE_PATH))
         :prepend t
         :jump-to-captured t
         :empty-lines-after 1
         :empty-lines-before 1)

        ("m" "Meeting" entry
         (file+headline ,(expand-file-name "meetings.org" my/ORG_BASE_PATH) "Meeting Notes")
         (file ,(expand-file-name ".templates/Meeting_Template.org" my/ORG_BASE_PATH))
         :prepend t
         :jump-to-captured t
         :empty-lines-after 1
         :empty-lines-before 1
         :time-prompt 1)

        ("l" "Lead" entry
         (file+headline ,(expand-file-name "leads.org" my/ORG_BASE_PATH) "LEADS")
         (file ,(expand-file-name ".templates/New_Lead_Template.org" my/ORG_BASE_PATH))
         :prepend t
         :jump-to-captured t
         :empty-lines-after 0
         :empty-lines-before 0)

        ("j" "Journal Log" plain
         (file+function ,(expand-file-name "journal.org" my/ORG_BASE_PATH)
                        (lambda ()
                          (org-datetree-find-date-create
                           (org-date-to-gregorian (org-today)) t)
                          (re-search-forward "^\\*.+ Log.+]" nil t)))
         (file ,(expand-file-name ".templates/Journal_Template.org" my/ORG_BASE_PATH))
         :prepend nil
         :jump-to-captured nil
         :empty-lines-before 1
         :empty-lines-after 1)

        ("J" "Journal Outline" entry
         (file+olp+datetree ,(expand-file-name "journal.org" my/ORG_BASE_PATH) "Journal")
         (file ,(expand-file-name ".templates/Journal_Outline_Template.org" my/ORG_BASE_PATH))
         :prepend nil
         :immediate-finish t
         :jump-to-captured t
         :empty-lines-before 0
         :empty-lines-after 0)
        ))


  ;; Disable Line Number in Org mode
;  (defun my-display-numbers-hook ()
;    (display-line-numbers-mode 0))
;
;  (add-hook 'org-mode-hook 'my-display-numbers-hook)


  ;; Org Refile
(setq org-refile-targets
      `((,(expand-file-name "tasks.org" my/ORG_BASE_PATH) :maxlevel . 1)
        (,(expand-file-name "meetings.org" my/ORG_BASE_PATH) :maxlevel . 1)))

  (setq org-refile-use-outline-path nil)
  (setq org-refile-allow-creating-parent-nodes t)
  (setq org-outline-path-complete-in-steps nil)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (expand-file-name "notebooks/org-roam" my/BASE_PATH))
  :config
  ;; Enable automatic DB sync
  (org-roam-db-autosync-mode))


(use-package org-super-agenda :ensure t) 
(require 'org-super-agenda) 
(org-super-agenda-mode t) 
(setq org-super-agenda-keep-order t) 
; (org-agenda nil "a") 
(setq org-super-agenda-header-separator "\n") 
(setq org-agenda-custom-commands '( 
  ("d" "Day" ( 
    (todo "" ((org-agenda-overriding-header "* GOALS *\n") 
              (org-agenda-prefix-format '((todo . " %?-12t"))) 
              (org-agenda-hide-tags-regexp ".") ;; Hides all tags 
              (org-agenda-files '("D:/notebooks/org/Goals.org" )) 
              (org-super-agenda-groups '( 
                (:name "" :todo "->" :order 2) 
                (:discard (:anything)) 
              )) 
    )) 
    (agenda "" ((org-agenda-block-separator nil) 
                (org-agenda-span 'day) 
                (org-agenda-entry-types '(:deadline)) 
                (org-agenda-prefix-format '((agenda . " %i %?-12t %-12s"))) 
                (org-deadline-warning-days 30) 
                (org-agenda-overriding-header "\n* Deadlines *\n"))) 
    (agenda "" ((org-agenda-block-separator nil) 
                (org-agenda-span 1) 
                (org-agenda-repeating-timestamp-show-all t) 
                (org-agenda-entry-types '(:timestamp :sexp :scheduled)) 
                (org-agenda-prefix-format '((agenda . " %i %?-12t %-12s"))) 
                (org-agenda-overriding-header "\n* Today *\n") 
                (org-super-agenda-groups '((:name "Tasks" :todo "ACT" :order 1) 
                                           (:name "Waiting on" :todo "WAIT" :order 2) 
                                           (:name "Other" :todo t :order 3))))) 
    (agenda "" ((org-agenda-block-separator nil) 
                (org-agenda-start-day "+1d") 
                (org-agenda-span 2) 
                (org-agenda-repeating-timestamp-show-all t) 
                (org-agenda-entry-types '(:timestamp :sexp :scheduled)) 
                (org-agenda-prefix-format '((agenda . " %i %?-12t %-12s"))) 
                (org-agenda-overriding-header "\n* Upcoming *\n"))) 
    (todo "" ((org-agenda-overriding-header "* Open Task List *\n") 
              (org-agenda-prefix-format '((todo . "%-12(let ((scheduled (org-get-scheduled-time (point)))) (if scheduled (format-time-string \"%d.%m.%Y\" scheduled) \"\")) %i "))) 
              (org-agenda-files '("D:/notebooks/org/tasks.org" "D:/notebooks/org/meetings.org")) 
              (org-super-agenda-groups '( 
                (:name "" :todo "ACT" :order 1) 
                (:name "" :todo "WAIT" :order 2) 
                (:name "" :todo "DELIGATED" :order 3) 
                (:name "Meeting Tasks" :file-path ("D:/notebooks/org/meetings.org") :order 4) 
              )) 
    )) 
    (todo "" ((org-agenda-overriding-header "* Project Task List *\n") 
              (org-agenda-prefix-format '((todo . "%-12(let ((scheduled (org-get-scheduled-time (point)))) (if scheduled (format-time-string \"%d.%m.%Y\" scheduled) \"\")) "))) 
              (org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org")) 
              (org-super-agenda-groups '( 
                (:name "Tasks" :todo "TODO" :order 1) 
                (:name "" :todo "Next" :order 2) 
                (:name "Projects" :todo "Execution&Monitoring" :order 3) 
                (:name "" :todo "Planning" :order 4) 
                (:name "" :todo "Initiation" :order 5) 
                (:discard (:tag ("Exclude"))) 
                (:discard (:todo ("WIP" "INTERN" "RÜCKSPRACHE" "GEPRÜFT"))) 
              )) 
    )) 
  )) 
  ("P" "Project Task List" ( 
    (todo "" ((org-agenda-overriding-header "Project Task List") 
              (org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org")) 
              (org-agenda-prefix-format '((todo . "%-12(let ((scheduled (org-get-scheduled-time (point)))) (if scheduled (format-time-string \"%d.%m.%Y\" scheduled) \"\")) %i "))) 
              (org-super-agenda-groups '( 
                (:discard (:todo ("WIP" "INTERN" "RÜCKSPRACHE" "GEPRÜFT"))) 
                (:discard (:tag ("Exclude"))) 
              ))))) 
    nil ("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/Project_Task_List.html")) 
  ("z" "Project Agenda Overview" ( 
    (agenda "" ((org-agenda-block-separator nil) 
                (org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org")) 
                (org-agenda-prefix-format '( (agenda . "%s %b %?-2i %t"))) 
                (org-agenda-entry-types '(:deadline)) 
                (org-agenda-span 1) 
                (org-deadline-warning-days 60) 
                (org-agenda-overriding-header "\n* Deadlines *\n"))) 
    (agenda "" ((org-agenda-overriding-header "Project Task List") 
                (org-agenda-files '("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/ReOxy_Guide.org")) 
                (org-agenda-span 90) 
                (org-agenda-repeating-timestamp-show-all t) 
                (org-agenda-skip-scheduled-if-done nil) 
                (org-agenda-entry-types '(:timestamp :sexp :scheduled)) 
                (org-agenda-include-diary nil) 
                (org-agenda-current-time-string "") 
                (org-agenda-time-grid '((daily) () "" "")) 
                (org-agenda-prefix-format '( (agenda . "%b %?-2i %t "))) 
                (org-super-agenda-groups '( 
                  ;; (:discard (:not (:todo ("Next" "TODO" "DONE")))) 
                  ;; (:auto-outline-path t) 
                  ;; (:auto-planning t) 
                  ;; (:auto-property "Project") 
                  ;; (:auto-tags t) 
                  ;; (:auto-category t) 
                  (:discard (:todo ("WIP" "INTERN" "RÜCKSPRACHE" "GEPRÜFT"))) 
                  (:discard (:tag ("Exclude"))) 
                  (:name " Overdue " ; Optionally specify section name 
                   :scheduled past :face 'warning) 
                  (:name "" ; Optionally specify section name 
                   :scheduled future :face 'warning)))))) 
    nil ("D:/office/OneDrive - Kröner Medizintechnik/resources/reoxy/ReOxy_Guide/Project_Agenda_Overview.html")) 
))



;; (use-package org-agenda-property
;;   :ensure t)
;; (setq org-agenda-property-list '("assigned" "assets" "condition"))

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
   '(("" . "")
    ("" . "")
    ("" . "")
    ("" . "")
    ("" . "")))

  (global-org-modern-mode) ;; maybe redundant

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
 '(org-startup-indented t)
 '(org-transclusion-extensions
   '(org-transclusion-src-lines org-transclusion-font-lock org-transclusion-indent-mode)))

    (set-face-attribute
     'org-transclusion-fringe nil
     :foreground "green"
     :background "green")

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

;; (use-package vertico
;;   :init
;;   (vertico-mode)
;;   ;; (setq vertico-scroll-margin 0) ;; Different scroll margin
;;   ;; (setq vertico-count 20) ;; Show more candidates
;;   ;; (setq vertico-resize t) ;; Grow and shrink the Vertico minibuffer
;;   ;; (setq vertico-cycle t)  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;;   )

;; (setq minibuffer-prompt-properties
;;       '(read-only t cursor-intangible t face minibuffer-prompt))
;; (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;; (setq enable-recursive-minibuffers t) ;;enables commands like M-x when in minibuffer

;; ;; Orderless

;; (use-package orderless
;;   :init
;;   ;; Configure a custom style dispatcher (see the Consult wiki)
;;   ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
;;   ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;;   (setq completion-styles '(orderless basic)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia

(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package helm
    :ensure t
    :config
    (helm-mode 1)
    ;; Optional: Helm display preferences
    (setq helm-display-header-line nil
          helm-split-window-inside-p t
          helm-autoresize-mode t)
    (setq helm-M-x-fuzzy-match t
          helm-buffers-fuzzy-matching t))

  (global-set-key (kbd "M-x") #'helm-M-x)

  (use-package helm-org
    :ensure t)

(defun my/helm-org-insert-link-to-heading ()
  "Insert a link to a heading in the current buffer using Helm for completion.
Shows the full outline path for disambiguation."
  (interactive)
  (require 'helm)
  (require 'org)
  (require 'org-id)
  (unless (derived-mode-p 'org-mode)
    (user-error "Not in an Org buffer"))
  (let* ((candidates
          (org-map-entries
           (lambda ()
             (let* ((pos (point-marker))
                    (path (org-get-outline-path t t)) ; list of parents
                    (heading (substring-no-properties (org-get-heading t t t t)))
                    (full-path (mapconcat #'identity (append path (list heading)) " → ")))
               (cons full-path pos)))))
         (selected (helm :sources
                         (helm-build-sync-source "Headings"
                           :candidates candidates)
                         :buffer "*helm org headings*")))
    (when selected
      (let (title id)
        (with-current-buffer (marker-buffer selected)
          (save-excursion
            (goto-char selected)
            (setq title (substring-no-properties
                         (org-get-heading t t t t)))
            (setq id (or (org-id-get) (org-id-get-create)))))
        (insert (org-make-link-string (concat "id:" id) title))))))

(defvar my/org-files-list
  `(,(expand-file-name "tasks.org" my/ORG_BASE_PATH)
    ,(expand-file-name "leads.org" my/ORG_BASE_PATH)
    ,(expand-file-name "goals.org" my/ORG_BASE_PATH))
  "List of Org files to be used for heading completion.")

(defun my/helm-org-insert-link-to-heading-mf ()
  "Insert a link to a heading from multiple Org files using Helm for completion.
Displays the outline path for disambiguation."
  (interactive)
  (require 'helm)
  (require 'org)
  (require 'org-id)
  ;; build candidates list: (DISPLAY . MARKER)
  (let ((candidates '()))
    (dolist (file my/org-files-list)
      (with-current-buffer (find-file-noselect file)
        (org-map-entries
         (lambda ()
           (let* ((pos (point-marker))
                  (path (org-get-outline-path t t))
                  (heading (substring-no-properties (org-get-heading t t t t)))
                  (full-path (mapconcat #'identity (append path (list heading)) " → "))
                  (display (format "%s  (%s)" full-path (file-name-nondirectory file))))
             (push (cons display pos) candidates))))))

    (setq candidates (nreverse candidates))

    ;; run Helm on the candidates
    (let ((selected
           (helm :sources
                 (helm-build-sync-source "Org Headings"
                   :candidates candidates)
                 :buffer "*helm org headings*")))
      (when selected
        (let (title id)
          (with-current-buffer (marker-buffer selected)
            (save-excursion
              (goto-char selected)
              (setq title (substring-no-properties (org-get-heading t t t t)))
              (setq id (or (org-id-get) (org-id-get-create)))))
          (insert (org-make-link-string (concat "id:" id) title)))))))

(use-package helm-org-rifle
:ensure t)

;  (use-package org-tidy
;    :ensure t
;    :hook
;    (org-mode . org-tidy-mode))
;
;
;  (setq org-tidy-general-drawer-name-blacklist '("LOGBOOK"))
;  (setq org-tidy-protect-overlay nil)

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
  :ensure t
  :init
  (which-key-mode)  ;; enable globally
  :config
  (setq which-key-idle-delay 0
        which-key-sort-order 'which-key-key-order-alpha
        which-key-popup-type 'side-window))  ;; safe option

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
  (setq evil-collection-mode-list '(dashboard dired org vertico ibuffer helm))
  (evil-collection-init))

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

;; (require 'icalendar)

;; (setq diary-file "d:/notebooks/org/cal.org")
;; (setq calendar-mark-diary-entries-flag t)
;; (add-to-list 'auto-mode-alist '("\\diary\\'" . diary-mode))
;; (setq diary-comment-start ";;")
;; (setq diary-comment-end "")
;; (setq org-agenda-include-diary t)
;; (add-hook 'diary-mode-hook 'real-auto-save-mode)
;; (add-hook 'diary-mode-hook #'abbrev-mode)

;; (use-package magit
;;   :ensure t)

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

;; (use-package yasnippet
;;   :config
;;   (setq yas-snippet-dirs '("D:/notebooks/org/.templates/yasnippets/"))
;;   (yas-global-mode 1))

(setq bookmark-default-file my/BOOKMARKS)

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

  ;; Helper: Toggle flyspell with dictionary selection
(defun my/flyspell-toggle ()
  "Toggle flyspell-mode and set dictionary based on buffer content or default."
  (interactive)
  (if flyspell-mode
      (progn
        (flyspell-mode -1)
        (message "Flyspell disabled"))
    ;; Enable flyspell
    (let ((dict (or ispell-local-dictionary "en_GB"))) ; fallback if nil
      (flyspell-mode 1)
      ;; Optionally choose dictionary interactively
      (setq dict
            (completing-read "Choose dictionary: "
                             '("en_GB" "de_DE_frami" "en_US" "de_DE")
                             nil t nil nil dict))
      (ispell-change-dictionary dict)
      (message "Flyspell enabled with dictionary %s" ispell-local-dictionary))))

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
    ":" '(helm-M-x :wk "helm-M-x")

    "f" '(:ignore t :wk "Files")
    "f f" '(find-file :wk "Find file")
    "f c" '((lambda () (interactive)
              (find-file "~/.config/emacs/config.org")) 
            :wk "Open config.org")
    "f g" '((lambda () (interactive)
              (find-file "d:/notebooks/org/goals.org")) 
            :wk "Open Goals.org")
    "f l" '((lambda () (interactive)
              (find-file "d:/notebooks/org/leads.org")) 
            :wk "Open Goals.org")
    "f m" '((lambda () (interactive)
              (find-file "d:/notebooks/org/meetings.org")) 
            :wk "Open Meetings.org")
    "f j" '((lambda () (interactive)
              (find-file "d:/notebooks/org/journal.org")) 
            :wk "Open Journal.org")
    "f t" '((lambda () (interactive)
              (find-file "d:/notebooks/org/tasks.org")) 
            :wk "Open Tasks.org")  
    "f r" '(recentf-open :wk "Recent Files")

    "TAB TAB" '(comment-dwim :wk "Add Comment")
    "TAB q" '(comment-line :wk "Comment line")

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

    ;; "h" '(:ignore t :wk "help")
    ;; "h r r" '((lambda () (interactive)
    ;;            (load-file "~/.config/emacs/init.el"))
    ;;          :wk "Reload emacs config")

    "d" '(:ignore t :wk "Dired")
    "d d" '(dired :wk "Dired")
    "d D" '(dired-other-window :wk "Dired other Window")

    "w" '(:ignore t :wk "window")
    "w w" '(other-window :wk "switch window")
    "w q" '(quit-window :wk "close window")
    "w o" '(delete-other-windows :wk "delete other window")
    "w v" '(split-window-right :wk "split vertical")

    "E" '(:ignore t :wk "eval")
    "E r" '(eval-region :wk "eval-R")
    "E b" '(eval-buffer :wk "eval-B")

    "e" '(:ignore t :wk "Embark")
    "e e" '(embark-act :wk "Act")
    "e d" '(embark-dwim :wk "Dwim")

    ;; Top-level Org prefix
    "o" '(:ignore t :wk "org")
    ;; Nested refile prefix
    "o r" '(:ignore t :wk "refile")
    ;; Actual command
    "o r r" '(org-refile :wk "Refile")
    "o r R" '(org-refile-copy :wk "Refile-Copy")
    "o r l" '(my/refile-copy-to-lead :wk "Refile-Lead")
    ;; "o TAB" '(org-tidy-toggle :wk "Org Tidy")
    "o a" '(org-agenda :wk "Agenda")
    "o A" '(my/org-agenda-inactive :wk "Agenda Time Stamp")
    "o w" '(org-store-agenda-views :wk "Write Agenda htmls")
    "o c" '(org-capture :wk "Capture")
    "o C" '(my/capture-without-id-at-point :wk "Capture without ID")
    "o d" '(org-deadline :wk "Deadline")
    "o f" '(helm-org-rifle :wk "Org-Rifle ")
    "o i" '(my/helm-org-insert-link-to-heading-mf :wk "Insert Link to Heading")
    "o I" '(org-insert-link :wk "Insert selected Link")
    "o j" '(my/journal-capture-without-id-at-point :wk "Journal Entry")
    "o J" '(my/journal-outline-capture-without-id-at-point :wk "Journal Outline")
    "o k" '(my/org-todo-insert-comment :wk "Add Comment")
    "o l" '(org-store-link :wk "Store Link")
    "o L" '(org-insert-last-stored-link :wk "Insert Link")
    "o n" '(org-add-note :wk "Add Note")
    "o o" '(org-open-at-point :wk "Open Link")
    "o s" '(org-schedule :wk "Schedule")
    "o u" '(my/org-unschedule :wk "Unschedule")
    "o U" '(my/org-undeadline :wk "Undead")
    "o z" '(org-cite-insert :wk "Cite")
    "o t" '(org-time-stamp :wk "Add Timestamp")
    ;;      "o t" '(org-set-tags-command :wk "Tags set/edit")
    "o T" '(org-time-stamp-inactive :wk "Add Interactive Timestamp")

    "g" '(:ignore t :wk "org-roam")
    "g f" '(org-roam-node-find :wk "node find")
    "g b" '(org-roam-buffer-toggle :wk "backlinks")
    "g i" '(org-roam-node-insert :wk "insert link")
    "g c" '(org-roam-capture :wk "roam capture")


    "s" '(:ignore t :wk "Snippets")
    "s s" '(org-insert-structure-template :wk "Insert Block")
    ;; "s y" '(yas-insert-snippet :wk "Insert Snippet")
    ;; "s n" '(yas-new-snippet :wk "New Snippet")
    )
  )

(setq backup-directory-alist
      '((".*" . "~/.config/emacs/tmp/backups/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.config/emacs/tmp/backups/" t)))

;; Org-Mode Custom Commands
(defun my/org-unschedule ()
  (interactive)
  (let ((current-prefix-arg '(4))) ;; emulate C-u
    (call-interactively 'org-schedule))) ;; invoke align-regexp interactivel

(defun my/org-current-date-time-string ()
  "Return the current date and time as a string."
  (format-time-string "%Y-%m-%d %H:%M:%S" (current-time)))

(defun my/org-undeadline ()
  (interactive)
  (let ((current-prefix-arg '(4))) ;; emulate C-u
    (call-interactively 'org-deadline))) ;; invoke align-regexp interactivel

(defun my/capture-without-id-at-point()
  (interactive)
  (let ((org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))
    (org-capture nil)))

(defun my/journal-capture-without-id-at-point()
  (interactive)
  (let ((org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))
    (org-capture nil "j")))

(defun my/journal-outline-capture-without-id-at-point()
  (interactive)
  (let ((org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id))
    (org-capture nil "J")))

(defun my/refile-and-jump ()
  "Refile the current subtree and jump to the new location."
  (interactive)
  (let ((org-refile-targets '(("d:/notebooks/org-roam/20250822102844-roam_leads.org" :maxlevel . 2))))
    (org-refile-copy)
    (org-refile-goto-last-stored)
    (org-set-property "CREATED_AT" (format-time-string "[%Y-%m-%d %a %H:%M]"))))

(defun my/find-duplicate-lines ()
  "Find and highlight duplicate lines in the current buffer."
  (interactive)
  (require 'hi-lock)
  (let ((line-hash (make-hash-table :test 'equal))
        (duplicates '()))
    (save-excursion
      (goto-char (point-min))
      ;; Iterate over lines in the buffer
      (while (not (eobp))
        (let ((line (string-trim (thing-at-point 'line t))))
          (when (and line (not (string-empty-p line)))
            (if (gethash line line-hash)
                (add-to-list 'duplicates line)
              (puthash line t line-hash))))
        (forward-line 1)))
    ;; Highlight duplicates
    (hi-lock-mode 1)
    (dolist (dup duplicates)
      (highlight-lines-matching-regexp (regexp-quote dup) 'hi-yellow))
    (if duplicates
        (message "Found duplicate lines!")
      (message "No duplicate lines found."))))

(defun my/find-duplicate-org-ids ()
  "Find and highlight duplicate :ID: entries in the current buffer."
  (interactive)
  (require 'hi-lock)
  (let ((id-hash (make-hash-table :test 'equal))
        (duplicates '()))
    (save-excursion
      (goto-char (point-min))
      ;; Search for :ID: entries
      (while (re-search-forward "^\\s-*:ID:\\s-+\\([a-zA-Z0-9-]+\\)" nil t)
        (let ((id (match-string 1)))
          (if (gethash id id-hash)
              (add-to-list 'duplicates id)
            (puthash id t id-hash))))
      ;; Highlight duplicates
      (hi-lock-mode 1)
      (dolist (dup duplicates)
        (highlight-regexp (format "^\\s-*:ID:\\s-+%s" (regexp-quote dup)) 'hi-yellow)))
    (if duplicates
        (message "Found duplicate :ID: entries!")
      (message "No duplicate :ID: entries found."))))

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


(defun my/beorg_sync ()		
  (interactive)

  (when (string-equal (buffer-file-name) "d:/notebooks/org/tasks.org")
    ;; Dynamic scoping to the rescue
    (write-region nil nil "d:/notebooks/org/beorg_sync/tasks_beorg.org" nil nil nil nil))

  ;; (when (string-equal (buffer-file-name) "d:/notebooks/org/journal.org")
  ;;   ;; Dynamic scoping to the rescue
  ;;   (write-region nil nil "d:/notebooks/org/beorg_sync/journal_wr.org" nil nil nil nil))

(when (string-equal (buffer-file-name) "d:/notebooks/org/leads.org")
  ;; Dynamic scoping to the rescue
  (write-region nil nil "d:/notebooks/org/beorg_sync/leads_beorg.org" nil nil nil nil)))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'my/beorg_sync)))

(defun my/org-babel-tangle-config ()
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))
    )
  ) 

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'my/org-babel-tangle-config)))

;;  (defun my/push-to-drop ()		
;;    (interactive)
;;
;;    (when (string-equal (buffer-file-name) "d:/notebooks/org/Tasks.org")
;;      ;; Dynamic scoping to the rescue
;;      (write-region nil nil "d:/notebooks/Dropbox/org/Tasks_wr.org" nil nil nil nil))
;;
;;    (when (string-equal (buffer-file-name) "d:/notebooks/org/Journal.org")
;;      ;; Dynamic scoping to the rescue
;;      (write-region nil nil "d:/notebooks/Dropbox/org/Journal_wr.org" nil nil nil nil)))
;;
;;  (add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'my/push-to-drop)))
