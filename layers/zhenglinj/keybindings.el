;;; keybindings.el --- zhenglinj layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Zheng, Linjun
;;
;; Author: Zheng, Linjun
;; URL:
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(unbind-key "C-." flyspell-mode-map)
(global-set-key (kbd "C-.") 'set-mark-command)
