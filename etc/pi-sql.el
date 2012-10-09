;; Pour SQL
;; Mode par défaut: MySQL
(add-hook 'sql-mode-hook 'sql-highlight-mysql-keywords)
;; Sauve l'historique (voir http://www.emacswiki.org/emacs/SqlMode )
(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
        (rval 'sql-product))
    (if (symbol-value rval)
        (let ((filename
               (concat (cuid (symbol-name (symbol-value rval)))
                       (user-real-login-name)
                       "-history.sql")))
          (set (make-local-variable lval) filename))
      (error
       (format "SQL history will not be saved because %s is nil"
               (symbol-name rval))))))

(add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)
(add-hook 'sql-interactive-mode-hook '(lambda nil (toggle-truncate-lines 1)))

(eval-after-load "sql"
  '(progn
     (define-key sql-interactive-mode-map (kbd "TAB") 'complete-symbol)
     (when pi-use-skeleton-pair-insert-maybe
       (define-key sql-mode-map "\{" 'skeleton-pair-insert-maybe)
       (define-key sql-mode-map "\(" 'skeleton-pair-insert-maybe)
       (define-key sql-mode-map "[" 'skeleton-pair-insert-maybe)
       (define-key sql-mode-map "\"" 'skeleton-pair-insert-maybe)
       (define-key sql-mode-map "'" 'skeleton-pair-insert-maybe))))


;; Local variables:
;; coding: utf-8
;; End:
