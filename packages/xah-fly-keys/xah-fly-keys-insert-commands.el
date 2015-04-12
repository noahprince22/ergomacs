;;-*- coding: utf-8 -*-
;; 〈Emacs Unicode Math Symbols Input Mode (xmsi-mode)〉 http://ergoemacs.org/emacs/xmsi-math-symbols-input.html

(defun xah-insert-bracket-pair (φleft-bracket φright-bracket)
  "Insert a matching bracket and place cursor in between.

If there's a text selection, insert brackets around it.
If there's no text selection:
  If the char before cursor is alphanumeric, insert brackets around current word.
  else, insert brackets at cursor position.

Alphanumeric char here includes hyphen ＆ underscore.

The arguments φleft-bracket ＆ φright-bracket are strings.

• 〈Emacs Lisp: Insert Brackets by Pair〉 http://ergoemacs.org/emacs/elisp_insert_brackets_by_pair.html
• 〈Matching Brackets in Unicode〉 URL `http://xahlee.info/comp/unicode_matching_brackets.html'
"
  (if (use-region-p)
      (progn
        (let (
              (p1 (region-beginning))
              (p2 (region-end)))
          (goto-char p2)
          (insert φright-bracket)
          (goto-char p1)
          (insert φleft-bracket)
          (goto-char (+ p2 2))))
    (progn ; no text selection
      (if (or
           (looking-at "[_-A-Za-z0-9]"))
          (progn
            (let ( p1 p2)
              (skip-chars-backward "-A-Za-z0-9")
              (setq p1 (point))
              (skip-chars-forward "-A-Za-z0-9")
              (setq p2 (point))
              (goto-char p2)
              (insert φright-bracket)
              (goto-char p1)
              (insert φleft-bracket)
              (goto-char (+ p2 (length φleft-bracket)))))
        (progn
          (insert φleft-bracket φright-bracket)
          (search-backward φright-bracket ))))))

;; (insert-parentheses)

(defun xah-insert-paren () (interactive) (xah-insert-bracket-pair "(" ")") )
(defun xah-insert-square-bracket () (interactive) (xah-insert-bracket-pair "[" "]") )
(defun xah-insert-brace () (interactive) (xah-insert-bracket-pair "{" "}") )
(defun xah-insert-greater-less () (interactive) (xah-insert-bracket-pair "<" ">") )

(defun xah-insert-single-angle-quote‹› () (interactive) (xah-insert-bracket-pair "‹" "›") )
(defun xah-insert-double-angle-quote«» () (interactive) (xah-insert-bracket-pair "«" "»") )
(defun xah-insert-double-curly-quote“” () (interactive) (xah-insert-bracket-pair "“" "”") )
(defun xah-insert-curly-single-quote‘’ () (interactive) (xah-insert-bracket-pair "‘" "’") )
(defun xah-insert-ascii-double-quote () (interactive) (xah-insert-bracket-pair "\"" "\"") )
(defun xah-insert-ascii-single-quote () (interactive) (xah-insert-bracket-pair "'" "'") )
(defun xah-insert-emacs-quote () (interactive) (xah-insert-bracket-pair "`" "'") )
(defun xah-insert-corner-bracket「」 () (interactive) (xah-insert-bracket-pair "「" "」") )
(defun xah-insert-white-corner-bracket『』 () (interactive) (xah-insert-bracket-pair "『" "』") )
(defun xah-insert-angle-bracket〈〉 () (interactive) (xah-insert-bracket-pair "〈" "〉") )
(defun xah-insert-double-angle-bracket《》 () (interactive) (xah-insert-bracket-pair "《" "》") )
(defun xah-insert-white-lenticular-bracket〖〗 () (interactive) (xah-insert-bracket-pair "〖" "〗") )
(defun xah-insert-black-lenticular-bracket【】 () (interactive) (xah-insert-bracket-pair "【" "】") )
(defun xah-insert-tortoise-shell-bracket〔〕 () (interactive) (xah-insert-bracket-pair "〔" "〕") )



(defun xah-insert-string-assignment ()
  "Insert space before cursor"
  (interactive)
  (progn (insert "=\"\"")
         (left-char)))

(defun xah-insert-space-before ()
  "Insert space before cursor"
  (interactive)
  (insert " "))

(defun xah-insert-space-after ()
  "Insert space after cursor"
  (interactive)
  (insert " ")
  (left-char))

(defun xah-insert-form-feed ()
  "insert a form feed char (ASCII 12)"
  (interactive)
  (insert ""))



(defun xah-insert-column-counter (n)
  "Insert a sequence of numbers vertically.

 (this command is similar to emacs 24.x's `rectangle-number-lines'.)

For example, if your text is:

a b
c d
e f

and your cursor is after “a”, then calling this function with argument
3 will change it to become:

a1 b
c2 d
e3 f

If there are not enough existing lines after the cursor
when this function is called, it aborts at the last line.

This command is conveniently used together with `kill-rectangle' and `string-rectangle'."
  (interactive "nEnter the max integer: ")
  (let ((i 1) colpos )
    (setq colpos (- (point) (line-beginning-position)))
    (while (<= i n)
      (insert (number-to-string i))
      (forward-line) (beginning-of-line) (forward-char colpos)
      (setq i (1+ i)))))

(defun xah-insert-alphabets-az (&optional φuse-uppercase-p)
  "Insert letters a to z vertically.
If `universal-argument' is called first, use CAPITAL letters.
Note: this command is similar to `rectangle-number-lines', starting at 65 or 97, and with a format of 「%c」."
  (interactive "P")
  (let ((startChar (if φuse-uppercase-p 65 97 )))
    (dotimes (ii 26)
      (insert (format "%c\n" (+ startChar ii))))))

(defvar xah-unicode-list nil "Associative list of Unicode symbols. First element is a Unicode character, second element is a string used as key shortcut in `ido-completing-read'")
(setq xah-unicode-list
      '(
        ("◇" . "3" )
        ("◆" . "4" )
        ("¤" . "2" )
        ("…" . "." )
        (" " . "s" )
        ("、" . "," )
        ("•" . "8" )
        ("⭑" . "9" )
        ("🎶" . "5" )
        ("—" . "-" )
        ("＆" . "7" )
        ("↓" . "at")
        ("←" . "ah")
        ("→" . "an")
        ("↑" . "ac")
        ("👍" . "tu")
        ) )

(defun xah-insert-unicode ()
  "Insert a unicode"
  (interactive)
  (let (gotThis)
    (setq gotThis
          (ido-completing-read "insert:" (mapcar (lambda (x) (concat (car x) (cdr x))) xah-unicode-list)))
    (insert (car (assoc (substring gotThis 0 1) xah-unicode-list)))))
