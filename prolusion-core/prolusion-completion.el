;; Version: $Id$
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion requirements
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(prolusion/require-package 'company)
(prolusion/require-package 'company-tern)
(prolusion/require-package 'company-jedi)
(prolusion/require-package 'company-irony)
(prolusion/require-package 'company-irony-c-headers)
(prolusion/require-package 'company-anaconda)
(prolusion/require-package 'company-qml)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion configuration
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq jedi:complete-on-dot t)
(setq jedi:environment-root prolusion-jedi-dir)

(setq python-environment-directory prolusion-jedi-dir)
(setq python-environment-default-root-name "root")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion setup
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq company-idle-delay 0.2)
(setq company-echo-delay 0.0)
(setq company-minimum-prefix-length 1)
(setq company-tooltip-flip-when-above t)
(setq company-dabbrev-downcase nil)

(setq anaconda-mode-installation-directory (expand-file-name "prolusion-anaconda" prolusion-dir))

(eval-after-load 'company '(add-to-list 'company-backends 'company-irony))
(eval-after-load 'company '(add-to-list 'company-backends 'company-irony-c-headers))
(eval-after-load 'company '(add-to-list 'company-backends 'company-cmake))
(eval-after-load 'company '(add-to-list 'company-backends 'company-jedi))
(eval-after-load 'company '(add-to-list 'company-backends 'company-anaconda))
(eval-after-load 'company '(add-to-list 'company-backends 'company-qml))
(eval-after-load 'company '(add-to-list 'company-backends 'company-tern))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion hooks
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook          'c-mode-hook  'company-mode)
(add-hook        'c++-mode-hook  'company-mode)
(add-hook       'objc-mode-hook  'company-mode)
(add-hook 'emacs-lisp-mode-hook  'company-mode)
(add-hook      'cmake-mode-hook  'company-mode)
(add-hook       'html-mode-hook  'company-mode)
(add-hook        'qml-mode-hook  'company-mode)
(add-hook        'js2-mode-hook  'company-mode)
(add-hook     'python-mode-hook  'company-mode)
(add-hook     'python-mode-hook 'anaconda-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion modeline
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval-after-load 'company '(diminish  'company-mode))
(eval-after-load 'company '(diminish 'anaconda-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Completion keybindings
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c c c") 'anaconda-mode-complete)
(global-set-key (kbd "C-c c d") 'anaconda-mode-find-definitions)
(global-set-key (kbd "C-c c a") 'anaconda-mode-find-assignments)
(global-set-key (kbd "C-c c r") 'anaconda-mode-find-references)
(global-set-key (kbd "C-c c b") 'anaconda-mode-go-back)
(global-set-key (kbd "C-c c s") 'anaconda-mode-show-doc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'prolusion-completion)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; prolusion-completion.el ends here
