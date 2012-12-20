;;-*- coding: utf-8 -*-

;; this file define keys that we want to set/unset because they are already defined by ergoemacs minor mode

(require 'edmacro)

(defvar ergoemacs-emacs-default-bindings
  '(("C-x" (prefix))
    ("C-@" (set-mark-command))
    ("C-a" (move-beginning-of-line))
    ("C-b" (backward-char))
    ("C-c" (prefix))
    ("C-d" (delete-char))
    ("C-e" (move-end-of-line))
    ("C-f" (forward-char))
    ("C-g" (keyboard-quit))
    ("C-h" (prefix))
    ("C-j" (newline-and-indent))
    ("C-k" (kill-line))
    ("C-l" (recenter recenter-top-bottom))
    ("RET" (newline))
    ("C-n" (next-line))
    ("C-o" (open-line))
    ("C-p" (previous-line))
    ("C-q" (quoted-insert))
    ("C-r" (isearch-backward))
    ("C-s" (isearch-forward))
    ("C-t" (transpose-chars))
    ("C-u" (universal-argument))
    ("C-v" (scroll-up-command scroll-up))
    ("C-w" (kill-region))
    ("C-x" (prefix))
    ("C-y" (yank))
    ("C-z" (suspend-frame iconify-or-deiconify-frame))
    ("ESC" (prefix))
    ("C-\\" (toggle-input-method))
    ("C-]" (abort-recursive-edit))
    ("C-_" (undo))
    ("C-SPC" (set-mark-command))
    ("C--" (negative-argument))
    ("C-/" (undo))
    ("C-0" (digit-argument))
    ("C-1" (digit-argument))
    ("C-2" (digit-argument))
    ("C-3" (digit-argument))
    ("C-4" (digit-argument))
    ("C-5" (digit-argument))
    ("C-6" (digit-argument))
    ("C-7" (digit-argument))
    ("C-8" (digit-argument))
    ("C-9" (digit-argument))
    ("<C-M-down>" (down-list))
    ("<C-M-end>" (end-of-defun))
    ("<C-M-home>" (beginning-of-defun))
    ("<C-M-left>" (backward-sexp))
    ("<C-M-right>" (forward-sexp))
    ("<C-M-up>" (backward-up-list))
    ("<C-S-backspace>" (kill-whole-line))
    ("<C-backspace>" (backward-kill-word))
    ("<C-delete>" (kill-word))
    ("<C-down>" (forward-paragraph))
    ("<C-end>" (end-of-buffer))
    ("<C-home>" (beginning-of-buffer))
    ("<C-insert>" (kill-ring-save))
    ("<C-insertchar>" (kill-ring-save))
    ("<C-left>" (left-word backward-word))
    ("<C-next>" (scroll-left))
    ("<C-prior>" (scroll-right))
    ("<C-right>" (right-word forward-word))
    ("<C-up>" (backward-paragraph))
    ("<C-wheel-down>" (mwheel-scroll))
    ("<C-wheel-up>" (mwheel-scroll))
    ("<M-begin>" (beginning-of-buffer-other-window))
    ("<M-end>" (end-of-buffer-other-window))
    ("<M-home>" (beginning-of-buffer-other-window))
    ("<M-left>" (left-word backward-word))
    ("<M-next>" (scroll-other-window))
    ("<M-prior>" (scroll-other-window-down))
    ("<M-right>" (right-word forward-word))
    ("<S-delete>" (kill-region))
    ("<S-insert>" (yank))
    ("<S-insertchar>" (yank))
    ("<again>" (repeat-complex-command))
    ("<begin>" (beginning-of-buffer))
    ("<compose-last-chars>" (compose-last-chars))
    ("<delete-frame>" (handle-delete-frame))
    ("<deletechar>" (delete-forward-char delete-char))
    ("<deleteline>" (kill-line))
    ("<down>" (next-line))
    ("<end>" (end-of-buffer move-end-of-line))
    ("<execute>" (execute-extended-command))
    ("<f1>" (prefix))
    ("<f10>" (menu-bar-open))
    ("<f2>" (prefix))
    ("<f3>" (kmacro-start-macro-or-insert-counter))
    ("<f4>" (kmacro-end-or-call-macro))
    ("<find>" (search-forward))
    ("<header-line>" (prefix))
    ("<help>" (prefix))
    ("<home>" (beginning-of-buffer move-beginning-of-line))
    ("<iconify-frame>" (ignore-event))
    ("<insert>" (overwrite-mode))
    ("<insertchar>" (overwrite-mode))
    ("<insertline>" (open-line))
    ("<left>" (left-char backward-char))
    ("<make-frame-visible>" (ignore-event))
    ("<menu>" (execute-extended-command))
    ("<mode-line>" (prefix))
    ("<next>" (scroll-up-command scroll-up))
    ("<open>" (find-file))
    ("<prior>" (scroll-down scroll-down-command))
    ("<redo>" (repeat-complex-command))
    ("<right>" (right-char forward-char))
    ("<select-window>" (handle-select-window))
    ("<switch-frame>" (handle-switch-frame))
    ("<undo>" (undo))
    ("<up>" (previous-line))
    
    ("C-h C-a" (about-emacs))
    ("C-h C-c" (describe-copying))
    ("C-h C-d" (view-emacs-debugging describe-distribution))
    ("C-h C-e" (view-external-packages view-emacs-problems))
    ("C-h C-f" (view-emacs-FAQ))
    ("C-h C-h" (help-for-help))
    ("C-h RET" (view-order-manuals))
    ("C-h C-n" (view-emacs-news))
    ("C-h C-o" (describe-distribution nil))
    ("C-h C-p" (view-emacs-problems describe-gnu-project))
    ("C-h C-t" (view-emacs-todo))
    ("C-h C-w" (describe-no-warranty))
    ("C-h C-\\" (describe-input-method))
    ("C-h ." (display-local-help))
    ("C-h 4" (prefix))
    ("C-h ?" (help-for-help))
    ("C-h C" (describe-coding-system))
    ("C-h F" (Info-goto-emacs-command-node))
    ("C-h I" (describe-input-method))
    ("C-h K" (Info-goto-emacs-key-command-node))
    ("C-h L" (describe-language-environment))
    ("C-h P" (describe-package nil))
    ("C-h S" (info-lookup-symbol))
    ("C-h a" (apropos-command))
    ("C-h b" (describe-bindings))
    ("C-h c" (describe-key-briefly))
    ("C-h d" (apropos-documentation))
    ("C-h e" (view-echo-area-messages))
    ("C-h f" (describe-function))
    ("C-h g" (describe-gnu-project nil))
    ("C-h h" (view-hello-file))
    ("C-h i" (info))
    ("C-h k" (describe-key))
    ("C-h l" (view-lossage))
    ("C-h m" (describe-mode))
    ("C-h n" (view-emacs-news))
    ("C-h p" (finder-by-keyword))
    ("C-h q" (help-quit))
    ("C-h r" (info-emacs-manual))
    ("C-h s" (describe-syntax))
    ("C-h t" (help-with-tutorial))
    ("C-h v" (describe-variable))
    ("C-h w" (where-is))
    ("C-h <f1>" (help-for-help))
    ("C-h <help>" (help-for-help))

    ("C-x C-@" (pop-global-mark))
    ("C-x C-b" (list-buffers))
    ("C-x C-c" (save-buffers-kill-terminal save-buffers-kill-emacs))
    ("C-x C-d" (list-directory))
    ("C-x C-e" (eval-last-sexp))
    ("C-x C-f" (find-file))
    ("C-x TAB" (indent-rigidly))
    ("C-x C-k" (prefix))
    ("C-x C-l" (downcase-region))
    ("C-x RET" (prefix))
    ("C-x C-n" (set-goal-column))
    ("C-x C-o" (delete-blank-lines))
    ("C-x C-p" (mark-page))
    ("C-x C-q" (toggle-read-only))
    ("C-x C-r" (find-file-read-only))
    ("C-x C-s" (save-buffer))
    ("C-x C-t" (transpose-lines))
    ("C-x C-u" (upcase-region))
    ("C-x C-v" (find-alternate-file))
    ("C-x C-w" (write-file))
    ("C-x C-x" (exchange-point-and-mark))
    ("C-x C-z" (suspend-frame iconify-or-deiconify-frame))
    ("C-x ESC" (prefix))
    ("C-x $" (set-selective-display))
    ("C-x '" (expand-abbrev))
    ("C-x (" (kmacro-start-macro))
    ("C-x )" (kmacro-end-macro))
    ("C-x *" (calc-dispatch))
    ("C-x +" (balance-windows))
    ("C-x -" (shrink-window-if-larger-than-buffer))
    ("C-x ." (set-fill-prefix))
    ("C-x 0" (delete-window))
    ("C-x 1" (delete-other-windows))
    ("C-x 2" (split-window-below split-window-vertically))
    ("C-x 3" (split-window-right split-window-horizontally))
    ("C-x 4" (prefix))
    ("C-x 5" (prefix))
    ("C-x 6" (prefix))
    ("C-x 8" (nil prefix))
    ("C-x ;" (comment-set-column))
    ("C-x <" (scroll-left))
    ("C-x =" (what-cursor-position))
    ("C-x >" (scroll-right))
    ("C-x [" (backward-page))
    ("C-x ]" (forward-page))
    ("C-x ^" (enlarge-window))
    ("C-x `" (next-error))
    ("C-x a" (prefix))
    ("C-x b" (switch-to-buffer))
    ("C-x d" (dired))
    ("C-x e" (kmacro-end-and-call-macro))
    ("C-x f" (set-fill-column))
    ("C-x h" (mark-whole-buffer))
    ("C-x i" (insert-file))
    ("C-x k" (kill-buffer))
    ("C-x l" (count-lines-page))
    ("C-x m" (compose-mail))
    ("C-x n" (prefix))
    ("C-x o" (other-window))
    ("C-x q" (kbd-macro-query))
    ("C-x r" (prefix))
    ("C-x s" (save-some-buffers))
    ("C-x u" (undo advertised-undo))
    ("C-x v" (prefix))
    ("C-x z" (repeat))
    ("C-x {" (shrink-window-horizontally))
    ("C-x }" (enlarge-window-horizontally))
    ("C-x DEL" (backward-kill-sentence))
    ("C-x C-SPC" (pop-global-mark))
    ("C-x C-+" (text-scale-adjust nil))
    ("C-x C--" (text-scale-adjust nil))
    ("C-x C-0" (text-scale-adjust nil))
    ("C-x C-=" (text-scale-adjust nil))
    ("C-x <C-left>" (previous-buffer))
    ("C-x <C-right>" (next-buffer))
    ("C-x <left>" (previous-buffer))
    ("C-x <right>" (next-buffer))
    
    ("M-0" (digit-argument))
    ("M-1" (digit-argument))
    ("M-2" (digit-argument))
    ("M-3" (digit-argument))
    ("M-4" (digit-argument))
    ("M-5" (digit-argument))
    ("M-6" (digit-argument))
    ("M-7" (digit-argument))
    ("M-8" (digit-argument))
    ("M-9" (digit-argument))
    
    ("C-M-@" (mark-sexp))
    ("C-M-a" (beginning-of-defun))
    ("C-M-b" (backward-sexp))
    ("C-M-c" (exit-recursive-edit))
    ("C-M-d" (down-list))
    ("C-M-e" (end-of-defun))
    ("C-M-f" (forward-sexp))
    ("C-M-h" (mark-defun))
    ("C-M-j" (indent-new-comment-line))
    ("C-M-k" (kill-sexp))
    ("C-M-l" (reposition-window))
    ("C-M-n" (forward-list))
    ("C-M-o" (split-line))
    ("C-M-p" (backward-list))
    ("C-M-r" (isearch-backward-regexp))
    ("C-M-s" (isearch-forward-regexp))
    ("C-M-t" (transpose-sexps))
    ("C-M-u" (backward-up-list))
    ("C-M-v" (scroll-other-window))
    ("C-M-w" (append-next-kill))
    ("ESC ESC" (prefix))
    ("C-M-\\" (indent-region))
    ("M-SPC" (just-one-space))
    ("M-!" (shell-command))
    ("M-$" (ispell-word))
    ("M-%" (query-replace))
    ("M-&" (async-shell-command nil))
    ("M-'" (abbrev-prefix-mark))
    ("M-(" (insert-parentheses))
    ("M-)" (move-past-close-and-reindent))
    ("M-*" (pop-tag-mark))
    ("M-," (tags-loop-continue))
    ("M--" (negative-argument))
    ("M-." (find-tag))
    ("M-/" (dabbrev-expand))
    ("M-:" (eval-expression))
    ("M-;" (comment-dwim))
    ("M-<" (beginning-of-buffer))
    ("M-=" (count-words-region count-lines-region))
    ("M->" (end-of-buffer))
    ("M-@" (mark-word))
    ("M-\\" (delete-horizontal-space))
    ("M-^" (delete-indentation))
    ("M-`" (tmm-menubar))
    ("M-a" (backward-sentence))
    ("M-b" (backward-word))
    ("M-c" (capitalize-word))
    ("M-d" (kill-word))
    ("M-e" (forward-sentence))
    ("M-f" (forward-word))
    ("M-g" (prefix))
    ("M-h" (mark-paragraph))
    ("M-i" (tab-to-tab-stop))
    ("M-j" (indent-new-comment-line))
    ("M-k" (kill-sentence))
    ("M-l" (downcase-word))
    ("M-m" (back-to-indentation))
    ("M-o" (prefix))
    ("M-q" (fill-paragraph))
    ("M-r" (move-to-window-line-top-bottom move-to-window-line))
    ("M-s" (prefix nil))
    ("M-t" (transpose-words))
    ("M-u" (upcase-word))
    ("M-v" (scroll-down-command scroll-down))
    ("M-w" (kill-ring-save))
    ("M-x" (execute-extended-command))
    ("M-y" (yank-pop))
    ("M-z" (zap-to-char))
    ("M-{" (backward-paragraph))
    ("M-|" (shell-command-on-region))
    ("M-}" (forward-paragraph))
    ("M-~" (not-modified))
    ("M-DEL" (backward-kill-word))
    ("C-M-S-v" (scroll-other-window-down))
    ("C-M-SPC" (mark-sexp))
    ("C-M-%" (query-replace-regexp))
    ("C-M--" (negative-argument))
    ("C-M-." (find-tag-regexp))
    ("C-M-/" (dabbrev-completion))
    ("C-M-0" (digit-argument))
    ("C-M-1" (digit-argument))
    ("C-M-2" (digit-argument))
    ("C-M-3" (digit-argument))
    ("C-M-4" (digit-argument))
    ("C-M-5" (digit-argument))
    ("C-M-6" (digit-argument))
    ("C-M-7" (digit-argument))
    ("C-M-8" (digit-argument))
    ("C-M-9" (digit-argument))
    ("ESC <C-backspace>" (backward-kill-sexp))
    ("ESC <C-delete>" (backward-kill-sexp))
    ("ESC <C-down>" (down-list))
    ("ESC <C-end>" (end-of-defun))
    ("ESC <C-home>" (beginning-of-defun))
    ("ESC <C-left>" (backward-sexp))
    ("ESC <C-right>" (forward-sexp))
    ("ESC <C-up>" (backward-up-list))
    ("ESC <begin>" (beginning-of-buffer-other-window))
    ("ESC <end>" (end-of-buffer-other-window))
    ("ESC <home>" (beginning-of-buffer-other-window))
    ("ESC <left>" (backward-word))
    ("ESC <next>" (scroll-other-window))
    ("ESC <prior>" (scroll-other-window-down))
    ("ESC <right>" (forward-word))
    
    ("M-s h" (prefix 1))
    ("M-s o" (occur 1))
    ("M-s w" (isearch-forward-word 1))
    
    ("M-o ESC" (prefix 1))
    ("M-o b" (facemenu-set-bold 1))
    ("M-o d" (facemenu-set-default 1))
    ("M-o i" (facemenu-set-italic 1))
    ("M-o l" (facemenu-set-bold-italic 1))
    ("M-o o" (facemenu-set-face 1))
    ("M-o u" (facemenu-set-underline 1))
    
    ("M-g ESC" (prefix))
    ("M-g g" (goto-line))
    ("M-g n" (next-error))
    ("M-g p" (previous-error))
    
    ("M-ESC ESC" (keyboard-escape-quit))
    ("M-ESC :" (eval-expression))
    
    ("<f1> C-a" (about-emacs))
    ("<f1> C-c" (describe-copying))
    ("<f1> C-d" (view-emacs-debugging describe-distribution))
    ("<f1> C-e" (view-external-packages view-emacs-problems))
    ("<f1> C-f" (view-emacs-FAQ))
    ("<f1> C-h" (help-for-help))
    ("<f1> RET" (view-order-manuals))
    ("<f1> C-n" (view-emacs-news))
    ("<f1> C-o" (describe-distribution nil))
    ("<f1> C-p" (view-emacs-problems describe-gnu-project))
    ("<f1> C-t" (view-emacs-todo))
    ("<f1> C-w" (describe-no-warranty))
    ("<f1> C-\\" (describe-input-method))
    ("<f1> ." (display-local-help))
    ("<f1> 4" (prefix))
    ("<f1> ?" (help-for-help))
    ("<f1> C" (describe-coding-system))
    ("<f1> F" (Info-goto-emacs-command-node))
    ("<f1> I" (describe-input-method))
    ("<f1> K" (Info-goto-emacs-key-command-node))
    ("<f1> L" (describe-language-environment))
    ("<f1> P" (nil describe-package))
    ("<f1> S" (info-lookup-symbol))
    ("<f1> a" (apropos-command))
    ("<f1> b" (describe-bindings))
    ("<f1> c" (describe-key-briefly))
    ("<f1> d" (apropos-documentation))
    ("<f1> e" (view-echo-area-messages))
    ("<f1> f" (describe-function))
    ("<f1> g" (nil describe-gnu-project))
    ("<f1> h" (view-hello-file))
    ("<f1> i" (info))
    ("<f1> k" (describe-key))
    ("<f1> l" (view-lossage))
    ("<f1> m" (describe-mode))
    ("<f1> n" (view-emacs-news))
    ("<f1> p" (finder-by-keyword))
    ("<f1> q" (help-quit))
    ("<f1> r" (info-emacs-manual))
    ("<f1> s" (describe-syntax))
    ("<f1> t" (help-with-tutorial))
    ("<f1> v" (describe-variable))
    ("<f1> w" (where-is))
    ("<f1> <f1>" (help-for-help))
    ("<f1> <help>" (help-for-help))
    
    ("<help> C-a" (about-emacs))
    ("<help> C-c" (describe-copying))
    ("<help> C-d" (describe-distribution view-emacs-debugging))
    ("<help> C-e" (view-emacs-problems view-external-packages))
    ("<help> C-f" (view-emacs-FAQ))
    ("<help> C-h" (help-for-help))
    ("<help> RET" (view-order-manuals))
    ("<help> C-n" (view-emacs-news))
    ("<help> C-o" (nil describe-distribution))
    ("<help> C-p" (describe-gnu-project view-emacs-problems))
    ("<help> C-t" (view-emacs-todo))
    ("<help> C-w" (describe-no-warranty))
    ("<help> C-\\" (describe-input-method))
    ("<help> ." (display-local-help))
    ("<help> 4" (prefix))
    ("<help> ?" (help-for-help))
    ("<help> C" (describe-coding-system))
    ("<help> F" (Info-goto-emacs-command-node))
    ("<help> I" (describe-input-method))
    ("<help> K" (Info-goto-emacs-key-command-node))
    ("<help> L" (describe-language-environment))
    ("<help> P" (nil describe-package))
    ("<help> S" (info-lookup-symbol))
    ("<help> a" (apropos-command))
    ("<help> b" (describe-bindings))
    ("<help> c" (describe-key-briefly))
    ("<help> d" (apropos-documentation))
    ("<help> e" (view-echo-area-messages))
    ("<help> f" (describe-function))
    ("<help> g" (nil describe-gnu-project))
    ("<help> h" (view-hello-file))
    ("<help> i" (info))
    ("<help> k" (describe-key))
    ("<help> l" (view-lossage))
    ("<help> m" (describe-mode))
    ("<help> n" (view-emacs-news))
    ("<help> p" (finder-by-keyword))
    ("<help> q" (help-quit))
    ("<help> r" (info-emacs-manual))
    ("<help> s" (describe-syntax))
    ("<help> t" (help-with-tutorial))
    ("<help> v" (describe-variable))
    ("<help> w" (where-is))
    ("<help> <f1>" (help-for-help))
    ("<help> <help>" (help-for-help))
    
    ("<f2> 2" (2C-two-columns))
    ("<f2> b" (2C-associate-buffer))
    ("<f2> s" (2C-split))
    ("<f2> <f2>" (2C-two-columns))
    
    ("C-h 4 i" (info-other-window))
    
    ("C-x C-k C-a" (kmacro-add-counter))
    ("C-x C-k C-c" (kmacro-set-counter))
    ("C-x C-k C-d" (kmacro-delete-ring-head))
    ("C-x C-k C-e" (kmacro-edit-macro-repeat))
    ("C-x C-k C-f" (kmacro-set-format))
    ("C-x C-k TAB" (kmacro-insert-counter))
    ("C-x C-k C-k" (kmacro-end-or-call-macro-repeat))
    ("C-x C-k C-l" (kmacro-call-ring-2nd-repeat))
    ("C-x C-k RET" (kmacro-edit-macro))
    ("C-x C-k C-n" (kmacro-cycle-ring-next))
    ("C-x C-k C-p" (kmacro-cycle-ring-previous))
    ("C-x C-k C-s" (kmacro-start-macro))
    ("C-x C-k C-t" (kmacro-swap-ring))
    ("C-x C-k C-v" (kmacro-view-macro-repeat))
    ("C-x C-k SPC" (kmacro-step-edit-macro))
    ("C-x C-k b" (kmacro-bind-to-key))
    ("C-x C-k e" (edit-kbd-macro))
    ("C-x C-k l" (kmacro-edit-lossage))
    ("C-x C-k n" (kmacro-name-last-macro))
    ("C-x C-k q" (kbd-macro-query))
    ("C-x C-k r" (apply-macro-to-region-lines))
    ("C-x C-k s" (kmacro-start-macro))
    
    ("C-x RET C-\\" (set-input-method))
    ("C-x RET F" (set-file-name-coding-system))
    ("C-x RET X" (set-next-selection-coding-system))
    ("C-x RET c" (universal-coding-system-argument))
    ("C-x RET f" (set-buffer-file-coding-system))
    ("C-x RET k" (set-keyboard-coding-system))
    ("C-x RET l" (set-language-environment))
    ("C-x RET p" (set-buffer-process-coding-system))
    ("C-x RET r" (revert-buffer-with-coding-system))
    ("C-x RET t" (set-terminal-coding-system))
    ("C-x RET x" (set-selection-coding-system))
    
    ("C-x ESC ESC" (repeat-complex-command))
    ("C-x M-:" (repeat-complex-command))
    
    ("C-x 4 C-f" (find-file-other-window))
    ("C-x 4 C-o" (display-buffer))
    ("C-x 4 ." (find-tag-other-window))
    ("C-x 4 0" (kill-buffer-and-window))
    ("C-x 4 a" (add-change-log-entry-other-window))
    ("C-x 4 b" (switch-to-buffer-other-window))
    ("C-x 4 c" (clone-indirect-buffer-other-window))
    ("C-x 4 d" (dired-other-window))
    ("C-x 4 f" (find-file-other-window))
    ("C-x 4 m" (compose-mail-other-window))
    ("C-x 4 r" (find-file-read-only-other-window))
    
    ("C-x 5 C-f" (find-file-other-frame))
    ("C-x 5 C-o" (display-buffer-other-frame))
    ("C-x 5 ." (find-tag-other-frame))
    ("C-x 5 0" (delete-frame))
    ("C-x 5 1" (delete-other-frames))
    ("C-x 5 2" (make-frame-command))
    ("C-x 5 b" (switch-to-buffer-other-frame))
    ("C-x 5 d" (dired-other-frame))
    ("C-x 5 f" (find-file-other-frame))
    ("C-x 5 m" (compose-mail-other-frame))
    ("C-x 5 o" (other-frame))
    ("C-x 5 r" (find-file-read-only-other-frame))
    
    ("C-x 6 2" (2C-two-columns))
    ("C-x 6 b" (2C-associate-buffer))
    ("C-x 6 s" (2C-split))
    ("C-x 6 <f2>" (2C-two-columns))
    
    ("C-x 8 RET" (2 ucs-insert))
    
    ("C-x a C-a" (add-mode-abbrev))
    ("C-x a '" (expand-abbrev))
    ("C-x a +" (add-mode-abbrev))
    ("C-x a -" (inverse-add-global-abbrev))
    ("C-x a e" (expand-abbrev))
    ("C-x a g" (add-global-abbrev))
    ("C-x a i" (prefix))
    ("C-x a l" (add-mode-abbrev))
    ("C-x a n" (expand-jump-to-next-slot))
    ("C-x a p" (expand-jump-to-previous-slot))
    
    ("C-x n b" (nil org-narrow-to-block))
    ("C-x n d" (narrow-to-defun))
    ("C-x n n" (narrow-to-region))
    ("C-x n p" (narrow-to-page))
    ("C-x n s" (nil org-narrow-to-subtree))
    ("C-x n w" (widen))
    
    ("C-x r C-@" (point-to-register))
    ("C-x r SPC" (point-to-register))
    ("C-x r +" (increment-register))
    ("C-x r N" (nil rectangle-number-lines))
    ("C-x r b" (bookmark-jump))
    ("C-x r c" (clear-rectangle))
    ("C-x r d" (delete-rectangle))
    ("C-x r f" (frame-configuration-to-register))
    ("C-x r g" (insert-register))
    ("C-x r i" (insert-register))
    ("C-x r j" (jump-to-register))
    ("C-x r k" (kill-rectangle))
    ("C-x r l" (bookmark-bmenu-list))
    ("C-x r m" (bookmark-set))
    ("C-x r n" (number-to-register))
    ("C-x r o" (open-rectangle))
    ("C-x r r" (copy-rectangle-to-register))
    ("C-x r s" (copy-to-register))
    ("C-x r t" (string-rectangle))
    ("C-x r w" (window-configuration-to-register))
    ("C-x r x" (copy-to-register))
    ("C-x r y" (yank-rectangle))
    ("C-x r C-SPC" (point-to-register))
    
    ("C-x v +" (nil vc-update))
    ("C-x v =" (vc-diff))
    ("C-x v D" (vc-directory vc-directory nil vc-root-diff))
    ("C-x v I" (nil vc-log-incoming))
    ("C-x v L" (nil vc-print-root-log))
    ("C-x v O" (nil vc-log-outgoing))
    ("C-x v a" (vc-update-change-log))
    ("C-x v b" (vc-switch-backend))
    ("C-x v c" (vc-cancel-version vc-rollback))
    ("C-x v d" (vc-dir))
    ("C-x v g" (vc-annotate))
    ("C-x v h" (vc-insert-headers))
    ("C-x v i" (vc-register))
    ("C-x v l" (vc-print-log))
    ("C-x v m" (vc-merge))
    ("C-x v r" (vc-retrieve-snapshot vc-retrieve-tag))
    ("C-x v s" (vc-create-snapshot vc-create-tag))
    ("C-x v u" (vc-revert-buffer vc-revert))
    ("C-x v v" (vc-next-action))
    ("C-x v ~" (vc-version-other-window vc-revision-other-window))
    
    ("M-s h f" (hi-lock-find-patterns 1))
    ("M-s h l" (highlight-lines-matching-regexp 1))
    ("M-s h p" (highlight-phrase 1))
    ("M-s h r" (highlight-regexp 1))
    ("M-s h u" (unhighlight-regexp 1))
    ("M-s h w" (hi-lock-write-interactive-patterns 1))
    
    ("M-o M-S" (center-paragraph 1))
    ("M-o M-o" (font-lock-fontify-block 1))
    ("M-o M-s" (center-line 1))
    
    ("M-g M-g" (goto-line))
    ("M-g M-n" (next-error))
    ("M-g M-p" (previous-error))
    
    ("<f1> 4 i" (info-other-window))
    
    ("<help> 4 i" (info-other-window))
    
    ("C-x a i g" (inverse-add-global-abbrev))
    ("C-x a i l" (inverse-add-mode-abbrev)))
  "Default Emacs Key Bindings")

(defcustom ergoemacs-guru nil
  "Unbind some commonly used keys such as <left> and <right> to
  get in the habit of using ergoemacs keybindings."
  :type 'boolean
  :set 'ergoemacs-set-default
  :group 'ergoemacs-mode)

(defcustom ergoemacs-guru-keys
  '("<left>"
     "<right>"
     "<up>"
     "<down>"
     "<C-left>"
     "<C-right>"
     "<C-up>"
     "<C-down>"
     "<M-left>"
     "<M-right>"
     "<M-up>"
     "<M-down>"
     "<delete>"
     "<C-delete>"
     "<M-delete>"
     "<next>"
     "<C-next>" 
     "<prior>"
     "<C-prior>" 
     "<home>"
     "<C-home>"
     "<end>"
     "<C-end>")
  "Keys to unbind if ergoemacs-guru is enabled."
  :type '(repeat
          (string :tag "Kbd code"))
  :set 'ergoemacs-set-default
  :group 'ergoemacs-mode)



(defvar ergoemacs-redundant-keys
  '("C-/"
    "C-0"
    "C-1"
    "C-2"
    "C-3"
    "C-4"
    "C-5"
    "C-6"
    "C-7"
    "C-8"
    "C-9"
    "C-<next>"
    "C-<prior>"
    "C-@"
    "C-M-%"
    "C-_"
    "C-a"
    "C-b"
    "C-d"
    "C-e"
    "C-f"
    "C-j"
    "C-k"
    "C-l"
    "C-n"
    "C-o"
    "C-p"
    "C-r"
    "C-s"
    "C-t"
    "C-v"
    "C-w"
    "C-x 0"
    "C-x 1"
    "C-x 2"
    "C-x 3"
    "C-x 5 0"
    "C-x 5 2"
    "C-x C-d"
    "C-x C-f"
    "C-x C-s"
    "C-x C-w"
    "C-x h"
    "C-x o"
    "C-y"
    "C-z"
    "M--"
    "M-0"
    "M-1"
    "M-2"
    "M-3"
    "M-4"
    "M-5"
    "M-6"
    "M-7"
    "M-8"
    "M-9"
    "M-<"
    "M->"
    "M-@"
    "M-\\"
    "M-a"
    "M-b"
    "M-c"
    "M-d"
    "M-e"
    "M-f"
    "M-h"
    "M-i"
    "M-j"
    "M-k"
    "M-l"
    "M-m"
    "M-n"
    "M-o"
    "M-p"
    "M-q"
    "M-r"
    "M-s"
    "M-t"
    "M-u"
    "M-v"
    "M-w"
    "M-x"
    "M-y"
    "M-z"
    "M-{"
    "M-}")
  "These are the redundant key bindings in emacs that ErgoEmacs unbinds.  Some exceptions we do not want to unset are:

Some exceptions we don't want to unset.
\"C-g\" 'keyboard-quit
\"C-i\" 'indent-for-tab-command
\"C-m\" 'newline-and-indent
\"C-q\" 'quote-insert
\"C-u\" 'universal-argument
\"C-h\" ; (help-map)
\"C-x\" ; (ctl-x-map)
\"C-c\" ; (prefix)
\"M-g\" ; (prefix)

")

(defun ergoemacs-format-where-is-buffer ()
  "Format a buffer created from a `where-is' command."
  (when (eq (nth 0 (nth 1 fn)) 'digit-argument)
    (goto-char (point-min))
    (while (re-search-forward "\\<\\([CMS]-\\)+" nil t)
      (when (not (save-match-data (looking-at last)))
        (replace-match "")
        (delete-char 1)
        (when (looking-at " *, *")
          (replace-match "")))))
  ;; Delete menu entires
  (goto-char (point-min))
  (when (re-search-forward "\\(?:, *\\)?<menu-bar>.*\\([(,]\\)" nil t)
    (replace-match "\\1"))
  ;; Reformat alaises
  (goto-char (point-min))
  (when (re-search-forward " *([^)]*);\n.*alias *" nil t)
    (replace-match "")))

(defmacro ergoemacs-create-old-key-description-fn (key)
  `(defun ,(intern (concat "/ergoemacs-old-key-" (md5 (format "%s" key)))) ()
     (interactive)
     (beep)
     (let ((fn (assoc ,key ergoemacs-emacs-default-bindings))
           (last (substring ,key -1)))
       (message "%s keybinding is disabled! Use %s"
                (ergoemacs-pretty-key ,key)
                (ergoemacs-pretty-key-rep
                 (with-temp-buffer
                   (when (and fn (not (eq 'prefix (nth 0 (nth 1 fn)))))
                     (where-is
                      (nth 0 (nth 1 fn))
                      t))
                   (ergoemacs-format-where-is-buffer)
                   (buffer-string)))))))

(mapc
 (lambda(x)
   (eval `(ergoemacs-create-old-key-description-fn ,x)))
 `(,@ergoemacs-redundant-keys ,@ergoemacs-guru-keys))

(defvar ergoemacs-global-not-changed-cache '()
  "Cache of global variables that have not changed")

(defvar ergoemacs-global-changed-cache '()
  "Cache of global variables that have changed.")

(defun ergoemacs-global-fix-defualt-bindings (kbd-code function)
  "Helper function to fix `ergoemacs-emacs-default-bindings' based on currently running emacs."
  (with-temp-buffer
    (insert-file-contents (expand-file-name "ergoemacs-unbind.el" ergoemacs-dir))
    (goto-char (point-min))
    (when (search-forward (format "(\"%s\"" kbd-code))
      (skip-chars-forward " (")
      (insert (format "%s " function)))
    (write-file (expand-file-name "ergoemacs-unbind.el" ergoemacs-dir))))

(defun ergoemacs-global-changed-p (key &optional is-variable complain fix)
  "Returns if a global key has been changed.  If IS-VARIABLE is
true and KEY is a string, then lookup the keyboard equivalent
based on current layout.

If COMPLAIN is true, complain about keys that have changed.

If FIX is true, open ergoemacs-unbind and fix the variables.
This should only be run when no global keys have been set.
"
  (let* ((key-code
          (cond
           ((eq (type-of key) 'string)
            (if is-variable
                (ergoemacs-kbd key)
              (read-kbd-macro
               (encode-coding-string
                key locale-coding-system))))
           (t key)))
         (key-kbd (key-description key-code)))
    (if (member key-kbd ergoemacs-global-changed-cache)
        (progn
          (when (or fix complain)
            (let* ((key-function (lookup-key (current-global-map) key-code t))
                   (old-bindings (assoc key-kbd ergoemacs-emacs-default-bindings))
                   (trans-function (if (keymapp key-function)
                                       'prefix
                                     key-function)))
              (message "Warning %s has been set globally. It is bound to %s not in %s." key-kbd
                       trans-function old-bindings)))
          t)
      (if (member key-kbd ergoemacs-global-not-changed-cache)
          nil
        (let* ((key-function (lookup-key (current-global-map) key-code t))
               (old-bindings (assoc key-kbd ergoemacs-emacs-default-bindings))
               (trans-function (if (keymapp key-function)
                                   'prefix
                                 key-function))
               (has-changed (if (not old-bindings)
                                nil ; Assume that if not known, it hasn't changed.
                              (not (memq trans-function (nth 1 old-bindings))))))
          (when (and has-changed
                     (condition-case err
                         (string-match "/ergoemacs-old-key-" (symbol-name key-function))
                       (error nil)))
            ;; Already unset, assume that the old key hasn't changed.
            (setq has-changed nil))
          (if has-changed
              (progn
                (when (or fix complain)
                  (message "Warning %s has been set globally. It is bound to %s not in %s." key-kbd
                           trans-function old-bindings)
                  (when fix
                    (ergoemacs-global-fix-defualt-bindings key-kbd trans-function)))
                (add-to-list 'ergoemacs-global-changed-cache key-kbd))
            (add-to-list 'ergoemacs-global-not-changed-cache key-kbd))
          ;;(message "%s %s %s" key-kbd key-function has-changed)
          (symbol-value 'has-changed))))))

(defun ergoemacs-warn-globally-changed-keys (&optional fix)
  "Warns about globally changed keys. If FIX is true, fix the ergoemacs-unbind file."
  (interactive)
  (mapc
   (lambda(x)
     (ergoemacs-global-changed-p (nth 0 x) nil t t))
   ergoemacs-emacs-default-bindings)
  (message "Ergoemacs Keys warnings for this layout:")
  (mapc
   (lambda(x)
     (and (eq 'string (type-of (nth 0 x)))
          (ergoemacs-global-changed-p (nth 0 x) nil t t)))
      (symbol-value (ergoemacs-get-fixed-layout)))
  (mapc
   (lambda(x)
     (and (eq 'string (type-of (nth 0 x)))
          (ergoemacs-global-changed-p (nth 0 x) t t)))
   (symbol-value (ergoemacs-get-variable-layout))))

(defvar ergoemacs-overridden-global-keys '()
  "Alist to store overridden keyboard shortcuts in
  `current-global-map' and other maps. Each item looks like '(MAP KEY OLD-COMMAND).")

(defun ergoemacs-unset-global-key (map key-s)
  "Sets to nil the associated command for the specified key in specified map.
It is like:

  \(define-key map (kbd key-s) nil))

But it saves the old command associated with the
specified key, so we can restore it when ergoemacs minor mode is
disabled at `ergoemacs-restore-global-keys'."
  (let (key oldcmd)
    (setq key (edmacro-parse-keys key-s))
    ;; get the old command associated with this key
    (setq oldcmd (lookup-key map key))
    ;; save that shortcut in ergoemacs-overridden-global-keys
    (if oldcmd
	(add-to-list 'ergoemacs-overridden-global-keys (cons map (cons key-s (cons oldcmd nil)))))
    ;; redefine the key in the ergoemacs-keymap
    (define-key map key (intern-soft (concat "/ergoemacs-old-key-" (md5 (format "%s" (key-description key))))))))

(defun ergoemacs-unset-redundant-global-keys ()
  "Unsets redundant keyboard shortcuts that should not be used in ErgoEmacs."
  (mapc (lambda (x)
          (unless (ergoemacs-global-changed-p x)
            (ergoemacs-unset-global-key (current-global-map) x)))
	`(,@ergoemacs-redundant-keys ,@(if ergoemacs-guru
                                           ergoemacs-guru-keys
                                         nil))))

(defvar ergoemacs-do-not-restore-list '()
  "List of keys to not restore.")
(defun ergoemacs-restore-global-keys ()
  "Restores all keyboard shortcuts that were overwritten by `ergoemacs-unbind-global-key'."
  (mapc (lambda (x)
          (let ((key (edmacro-parse-keys (car (cdr x)))))
            (unless (member (key-description key) ergoemacs-do-not-restore-list)
              (define-key
                (car x)
                key
                (car (cdr (cdr x)))))))
	ergoemacs-overridden-global-keys)
  ;; clear the lists
  (setq ergoemacs-global-not-changed-cache '())
  (setq ergoemacs-global-changed-cache '())
  (setq ergoemacs-overridden-global-keys '())
  (setq ergoemacs-do-not-restore-list '()))

(defun ergoemacs-pretty-key (code)
  "Creates Pretty keyboard binding from kbd CODE to like M-x to 【Alt+x】"
  (let ((ret code)
        (case-fold-search nil))
    (save-match-data
      (with-temp-buffer
        (insert "【")
        (insert code)
        (insert "】")
        (goto-char (point-min))
        (when (re-search-forward "\\<M-x\\>" nil t)
          ;;(replace-match (format "%s"
          ;;(ergoemacs-lookup-execute-extended-command)) t t)
          (replace-match "")
          (insert (ergoemacs-lookup-execute-extended-command)))
        (goto-char (point-min))
        (while (re-search-forward "\\> +\\<" nil t)
          (replace-match "】【"))
        (goto-char (point-min))
        (while (search-forward "M-" nil t)
          (replace-match "Alt+" t))
        (goto-char (point-min))
        (while (search-forward "C-" nil t)
          (replace-match "Ctrl+" t))
        (goto-char (point-min))
        (while (search-forward "S-" nil t)
          (replace-match "Shift+" t))
        (goto-char (point-min))
        (while (re-search-forward "[<>]" nil t)
          (replace-match ""))
        (goto-char (point-min))
        (setq ret (buffer-string))))
    (symbol-value 'ret)))

(defun ergoemacs-pretty-key-rep (code)
  "Finds keyboard binding codes such as C-x and replaces them with `ergoemacs-pretty-key' encoding."
  (let ((ret code)
        (case-fold-search nil))
    (save-match-data
      (with-temp-buffer
        (insert code)
        (goto-char (point-min))
        (while (re-search-forward "\\<\\([CMS]-\\)+.\\>" nil t)
          (replace-match (ergoemacs-pretty-key (match-string 0)) t t))
        (setq ret (buffer-string))))
    (symbol-value 'ret)))

;; Based on describe-key-briefly
(defun ergoemacs-where-is-old-binding (&optional key)
  "Print the name of the function KEY invoked before to start ErgoEmacs minor mode."
  (interactive
   (let ((enable-disabled-menus-and-buttons t)
	 (cursor-in-echo-area t)
	 saved-yank-menu)
     (unwind-protect
	 (let (key)
	   ;; If yank-menu is empty, populate it temporarily, so that
	   ;; "Select and Paste" menu can generate a complete event.
	   (when (null (cdr yank-menu))
	     (setq saved-yank-menu (copy-sequence yank-menu))
	     (menu-bar-update-yank-menu "(any string)" nil))
	   (setq key (read-key-sequence "Describe old key (or click or menu item): "))
	   ;; If KEY is a down-event, read and discard the
	   ;; corresponding up-event.  Note that there are also
	   ;; down-events on scroll bars and mode lines: the actual
	   ;; event then is in the second element of the vector.
	   (and (vectorp key)
		(let ((last-idx (1- (length key))))
		  (and (eventp (aref key last-idx))
		       (memq 'down (event-modifiers (aref key last-idx)))))
		(read-event))
	   (list key))
       ;; Put yank-menu back as it was, if we changed it.
       (when saved-yank-menu
	 (setq yank-menu (copy-sequence saved-yank-menu))
	 (fset 'yank-menu (cons 'keymap yank-menu))))))
  
  (let (key-desc item item-key item-cmd old-cmd)
    (setq key-desc (key-description key))
    (setq item ergoemacs-overridden-global-keys)
    (while (and item (not old-cmd))
      (setq item-key (car (cdr (car item))))
      (setq item-cmd (car (cdr (cdr (car item)))))
      (if (string= item-key key-desc)
	  (setq old-cmd item-cmd))
      (setq item (cdr item)))
    (if old-cmd
	(with-temp-buffer
	  (where-is old-cmd t)
          (ergoemacs-format-where-is-buffer)
	  (message "Key %s was bound to %s which is now invoked by %s"
		   (ergoemacs-pretty-key key-desc)
                   old-cmd
                   (ergoemacs-pretty-key-rep (buffer-string))))
      (message "Key %s was not bound to any command" (ergoemacs-pretty-key key-desc)))))
