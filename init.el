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
  (global-display-line-numbers-mode 1)
  (menu-bar--display-line-numbers-mode-relative)
  ;; (display-line-numbers-type 'relative)
  (global-hl-line-mode 1)

  ;; History

  (setq history-length 25)
  (savehist-mode 1)

  (setq recentf-max-saved-items 25)
  (recentf-mode 1)

  ;; Auto update buffers
  (global-auto-revert-mode)


(set-frame-parameter nil 'internal-border-width 10)
(set-frame-parameter nil 'alpha-background 90)

(add-to-list 'default-frame-alist '(width  . 100))
(add-to-list 'default-frame-alist '(height . 40))

;; (defvar my/org-dir-files "/mnt/d/notebooks/org")
;; (defvar my/org-agenda-files "/mnt/d/notebooks/DemacsNotes/org/Capture.org")
;; (setq my-org-capture-template-target "/mnt/d/notebooks/DemacsNotes/org/Capture.org")
;; (defvar my/backup-directory "/mnt/d/notebooks/org/.data/backups/")
;; (defvar my/org-templates "/mnt/d/notebooks/org/.templates")
(defvar my/bookmarks "/mnt/d/notebooks/org/.data/bookmarks")
(defvar my/org-id-locations-file "/mnt/d/notebooks/org/.data/.org-id-locations")
(defvar my/trash-directory "~/.config/emacs/tmp/trash")

;; Font Settings
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 180)

;; Theme Settings
;; (setq modus-themes-region'(bg-only))
;; (setq modus-themes-mode-line '(accented borderless padded))
;; (setq modus-themes-org-blocks 'gray-background)
;; (load-theme 'modus-vivendi t)

(use-package kaolin-themes
:config
(load-theme 'kaolin-dark t)
(kaolin-treemacs-theme))

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

;; DEFAULT BROWSER
   (setq browse-url-browser-function 'browse-url-generic       browse-url-generic-program "/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe")

(setq org-file-apps
   '(("\\.docx\\'" . default)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "firefox %s")
     (auto-mode . emacs)))

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

(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 0.1))

;; (use-package helpful
;;  :custom
;;  (counsel-describe-function-function #'helpful-callable)
;;  (counsel-describe-variable-function #'helpful-variable)
;;  :bind
;;  ([remap describe-function] . counsel-describe-function)
;;  ([remap describe-command] . helpful-command)
;;  ([remap describe-variable] . counsel-describe-variable)
;;  ([remap describe-key] . helpful-key))

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

; Diable Line 
     (defun my-display-numbers-hook ()
       (display-line-numbers-mode 0))

     (defun tmi/org-mode-setup ()
       (org-indent-mode)
       (setq evil-auto-indent t))

     (add-hook 'org-mode-hook 'my-display-numbers-hook)
     ;; (defun my/org-todo-insert-comment ()
     ;;       (interactive)
     ;;       (let ((current-prefix-arg '(4))) ;; emulate C-u
     ;;         (call-interactively 'org-todo))) ;; invoke align-regexp interactively

     ;; when calling store-link it creates a link unless there is a defined custom id.
     ;; when capture is called do not create an id.
     ;; when my/capture-with... is called it creates an id at point.
     ;; so we can say capture with id > task and it will create an id at point and link to that id.

     (defun my/capture-with-id-at-point()
       (interactive)
       (let ((org-id-link-to-org-use-id t))
         (org-capture nil)
         ))

     ;; (defun my/capture-journal-without-id()
     ;;   (org-capture nil))

     (use-package org
       :pin org
       :commands (org-capture org-agenda)
       :hook (org-mode . tmi/org-mode-setup)
       :config
       (setq org-directory-files '("/mnt/d/notebooks/org/")) ;;Default location of Org files
       (setq org-agenda-files '("/mnt/d/notebooks/org/Tasks.org" "/mnt/d/notebooks/org/Meetings.org")) ;;org agenda searches in this file or dir for todo items
       (setq org-ellipsis " +")
       (setq org-return-follows-link t)
       (setq org-log-done 'time) ;; timestamp on done
       (setq org-log-into-drawer t)
       (setq org-startup-folded nil)



       ;; Setup org-id

       (require 'org-id)
       (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
       ;; (org-id-method) 
       (setq org-id-locations-file my/org-id-locations-file) ;; set where id's are stored

       ;;Set Faces

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
             `(("t" "Tasks" entry (file+headline "/mnt/d/notebooks/org/Tasks.org" "Task List")
                (file "/mnt/d/notebooks/org/.templates/Task_Template.org")
                :prepend t
                :jump-to-captured t
                :empty-lines-after 1
                :empty-lines-before 1
                )

               ("m" "Meeting" entry (file+headline "/mnt/d/notebooks/org/Meetings.org" "Metting Notes")
                (file "/mnt/d/notebooks/org/.templates/Meeting_Template.org")
                :prepend t
                :jump-to-captured t
                :empty-lines-after 1
                :empty-lines-before 1
                :time-prompt 1
                )

               ("c" "Free Capture" entry (file+headline "/mnt/d/notebooks/org/org_capture.org" "Inbox")
                (file "/mnt/d/notebooks/org/.templates/Free_Capture_Template.org")
                :prepend t
                :empty-lines-before 0
                :empty-lines-after 0
                )

               ("j" "Journal Log" item (file+function "/mnt/d/notebooks/org/Journal.org"
                                                    (lambda ()
                                                      (org-datetree-find-date-create
                                                       (org-date-to-gregorian (org-today)) t)
                                                      (re-search-forward "^\\*.+ Log" nil t)))
                (file "/mnt/d/notebooks/org/.templates/Journal_Template.org")
                :empty-lines-before 1
                :empty-lines-after 1
                )

               ("J" "Journal Outline" entry (file+olp+datetree "/mnt/d/notebooks/org/Journal.org" "Journal")
                (file "/mnt/d/notebooks/org/.templates/Journal_Outline_Template.org")
                :prepend nil
                :empty-lines-before 0
                :empty-lines-after 0
                )

               )

             ;; Org global TODO States
             ;; (setq org-todo-keywords
             ;;	'((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
             ))

     ;; Org Refile

   (setq org-refile-targets
         (quote(("/mnt/d/notebooks/org/Tasks.org" :maxlevel . 1)
                ("/mnt/d/notebooks/org/Meetings.org" :maxlevel . 1)
                ("/mnt/d/notebooks/org/org_capture.org" :maxlevel . 1))))


   (setq org-refile-use-outline-path nil)
   (setq org-refile-allow-creating-parent-nodes t)
   (setq org-outline-path-complete-in-steps nil)


;;(org-id-get-with-outline-path-completion)
;; (defun my/org-add-ids-to-headlines-in-file ()
;;   "Add ID properties to all headlines in the current file which
;; do not already have one."
;;   (interactive)
;;   (org-map-entries 'org-id-get-create))

     ;; (add-hook 'org-mode-hook
     ;;           (lambda ()
     ;;             (add-hook 'before-save-hook 'my/org-add-ids-to-headlines-in-file nil 'local)))

     ;; (add-hook 'org-mode-hook 'org-indent-mode)

(setq org-agenda-window-setup 'reorganize-frame) 
(setq org-agenda-restore-windows-after-quit t)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("" "" "󰔶" "󰹞" "󰜁" "󰋘" "󱗿")))

(require 'icalendar)

(setq diary-file "/mnt/d/notebooks/org/cal.org")
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
(setq ob-mermaid-cli-path "~/mermaid/node_modules/.bin/mmdc")

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

;; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
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
    "f r" '(recentf-open :wk "Recent Files")

    "TAB TAB" '(comment-line :wk "Comment lines")

    "B" '(:ignore t :wk "bookmarks")
    "B b" '(list-bookmarks :wk "List bookmarks")
    "B s" '(bookmark-set :wk "Set bookmarks")
    "B S" '(bookmark-save :wk "Save bookmarks")

    "b" '(:ignore t :wk "buffer")
    "b b" '(switch-to-buffer :wk "switch buffer")
    "b i" '(ibuffer :wk "ibuffer")
    "b p" '(previous-buffer :wk "<- buffer")
    "b n" '(next-buffer :wk "buffer ->")
    "b k" '(kill-buffer :wk "kill buffer")


    "u" '(universal-argument :wk "u-arg")
    "q" '(exit-minibuffer :wk "Exit minib")

    "h" '(:ignore t :wk "help")
    "h r r" '((lambda () (interactive)
                (load-file "~/.config/emacs/init.el"))
              :wk "Reload emacs config")

    "d" '(:ignore t :wk "dir")
    "d d" '(switch-to-buffer :wk "placeholder")

 ;; "w" '(:ignore t :wk "window")
 ;; "w s"'(other-window :wk "switch window")
 ;; "w c"'(quit-window :wk "close window")
 ;; "w q" '(delete-other-windows :wk "delete other window")
 ;; "w v" '(evil-window-vsplit :wk "split vertical")

    "e" '(:ignore t :wk "eval")
    "e r" '(eval-region :wk "eval-r")
    "e b" '(eval-buffer :wk "eval-b")

    "o" '(:ignore t :wk "org")
    "o a" '(org-agenda :wk "Agenda")
    "o c" '(org-capture :wk "Capture")
    "o C" '(my/capture-with-id-at-point :wk "Capture with ID")
    "o l" '(org-store-link :wk "Store Link")
    "o i" '(org-insert-link :wk "Insert Link")
    "o s" '(org-schedule :wk "Schedule")
    "o d" '(org-deadline :wk "Deadline")
    "o t" '(org-set-tags-command :wk "Tags set/edit") 
    ;; "o k" '(my/org-todo-insert-comment :wk "Comment TODO item")
    "o n" '(org-add-note :wk "add note to current entry")
    "o o" '(org-open-at-point :wk "open link")
    "o ," '(org-cycle-agenda-files :wk "cycle agenda files")

    )
  )

(setq display-buffer-base-action
'((display-buffer-reuse-window
   display-buffer-reuse-mode-window
   display-buffer-same-window
   display-buffer-in-previous-window)))

(setq backup-directory-alist
      '((".*" . "~/.config/emacs/tmp/backups/")))
(setq auto-save-file-name-transforms
      `((".*" ,"~/.config/emacs/tmp/backups/" t)))

(setq bookmark-default-file my/bookmarks)

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
  (when (string-equal (buffer-file-name)
                      "/mnt/d/notebooks/org/Tasks.org")
    ;; Dynamic scoping to the rescue
    (write-region nil nil "/mnt/d/notebooks/org/tanglecapture.org" nil nil nil t)))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'my/push-to-drop)))
