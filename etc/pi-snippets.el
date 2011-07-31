;; Copyright (c) 2011, Philippe Ivaldi <www.piprime.fr>
;; $Last Modified on 2011/06/30

;; This program is free software ; you can redistribute it and/or modify
;; it under the terms of the GNU Lesser General Public License as published by
;; the Free Software Foundation ; either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY ; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Lesser General Public License for more details.

;; You should have received a copy of the GNU Lesser General Public License
;; along with this program ; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA


;; http://code.google.com/p/yasnippet/
(when (require 'yasnippet nil t)

  ;; `yas/next-field-key' can trigger stacked expansions.
  (setq yas/triggers-in-field t)

  (defun pi-basic-snippet-expand-condition ()
    (let ((char (char-to-string (char-after))))
      (not (string-match "[a-zA-Z]" char))))

  ;; Load the snippets
  (setq yas/root-directory (cuid "site-lisp/pi-snippets"))
  (yas/load-directory yas/root-directory)
  (yas/global-mode 1)

  ;; remaps some keys that makes some behavior change.
  ;; In my case it changed the TAB key, and thereby disabled Yasnippet.
  ;; http://tuxicity.se/emacs/javascript/js2-mode/yasnippet/2009/06/14/js2-mode-and-yasnippet.html
  (eval-after-load 'js2-mode
    '(progn
       (add-hook 'js2-mode
                 (lambda nil
                   (define-key js2-mode-map (kbd "TAB") (lambda()
                                              (interactive)
                                              (let ((yas/fallback-behavior 'return-nil))
                                                (unless (yas/expand)
                                                  (indent-for-tab-command)
                                                  (if (looking-back "^\s*")
                                                      (back-to-indentation))))))))))
  (when (featurep 'auto-complete)
    (require 'auto-complete-yasnippet "auto-complete-yasnippet.elc" t)))

;; Local variables:
;; coding: utf-8
;; End:
