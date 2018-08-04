;;; packages.el --- zhenglinj layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: zhenglj <zhenglj@zhengljdeMacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `zhenglinj-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zhenglinj/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zhenglinj/pre-init-PACKAGE' and/or
;;   `zhenglinj/post-init-PACKAGE' to customize the package as it is loaded.

(defconst zhenglinj-packages
  '(multiple-cursors
    lice
    figlet
    cnfonts
    ))

(defun zhenglinj/init-multiple-cursors ()
  (use-package multiple-cursors
    :config
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-+") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
    ;; From active region to multiple cursors:
    (global-set-key (kbd "C-c c r") 'set-rectangular-region-anchor)
    (global-set-key (kbd "C-c c c") 'mc/edit-lines)
    (global-set-key (kbd "C-c c e") 'mc/edit-ends-of-lines)
    (global-set-key (kbd "C-c c a") 'mc/edit-beginnings-of-lines)
    ))

(defun zhenglinj/init-lice ()
  (use-package lice
    :defer t
    :init
    :config
    (defun lice:insert-author (license)
      (insert (format "Author: %s  <%s>\n\n"
                      user-full-name user-mail-address)))
    (custom-set-variables
     '(lice:header-spec
       (quote
        (lice:insert-copyright lice:insert-author lice:insert-license))))
    ))

(defun zhenglinj/init-figlet ()
  (use-package figlet
    :defer t
    :init
    ;; Code to execute before package is loaded
    :config
    ;; Code to execute after package is loaded
    ))

(defun zhenglinj/init-cnfonts ()
  (use-package cnfonts
    :defer t
    :init
    ;; Code to execute before package is loaded
    :config
    ;; Code to execute after package is loaded
    ;; 让 cnfonts 随着 Emacs 自动生效。
    (cnfonts-enable)
    ;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
    (cnfonts-set-spacemacs-fallback-fonts)
    (setq cnfonts-profiles
          '("program" "org-mode" "read-book"))
    ))

(defun zhenglinj/init-cheat-sh ()
  (use-package cheat-sh
    :defer t
    :init
    ;; Code to execute before package is loaded
    :config
    ;; Code to execute after package is loaded
    ))
