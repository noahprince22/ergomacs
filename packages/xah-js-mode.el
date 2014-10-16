;;; xah-js-mode.el --- Major mode for editing JavaScript. -*- coding: utf-8 -*-

;; Copyright © 2013 by Xah Lee

;; Author: Xah Lee <xah@xahlee.org> ( http://xahlee.org/ )
;; Created: 2013-03-23
;; Keywords: languages, convenience

;; You can redistribute this program and/or modify it. Please give credit and link. Thanks.

;;; Commentary:
;; Major mode for editing JavaScript code. Beta stage.
;; home page:

;;; HISTORY

;; 2014-10-16 version are no longer logged here. just github latest.
;; version 0.2, 2013-12-25 added array methods and string method highlighting
;; version 0.1, 2013-08-21 first version

;; TODO
;; add new faces
;; separate diff types of keywords to use diff face
;; add indentation
;; add support for autocomplete



(require 'js) ; temp hack, to borrow its indentation function


(defvar xah-js-mode-hook nil "Standard hook for `xah-js-mode'")



(setq xjs-abbrev-table nil)

(define-abbrev-table 'xjs-abbrev-table
  '(
    ("f" "function" nil :system t)
    ("pt" "prototype" nil :system t)
    ("us" "\"use strict\";" nil :system t)
    ("cmt" "/* ▮ */" nil :system t)
    ;; ("ogopn" "Object.getOwnPropertyNames" nil :system t)

    ("cl" "console.log(▮)" nil :system t)

    ("do" "do { ▮; x++;} while (x != 5)" nil :system t)

    ("function" "function () { ▮; }" nil :system t)
    ("for" "for (var i = 0; i < ▮.length; i++) { ▮; }" nil :system t)
    ("while" "while (i<10) { ▮; i++; }" nil :system t)
    ("if" "if ( ▮ ) {
▮
}" nil :system t)

    ("else" "else { ▮ }" nil :system t)

    ("elf" "else if (▮) { ▮ }" nil :system t)

    ("ife" "test ? expr1 : expr2" nil :system t)

    ("switch" "switch(▮) {
    case ▮:
▮;
        break;
    case ▮:
▮;
        break;
    default:
        ▮;
}" nil :system t)

    ("case" "case ▮: ▮; break;" nil :system t)

    ("try" "try {
▮;
} catch(error) {
▮;
}" nil :system t)
    ("v" "var ▮ = ▮;" nil :system t)
    ("addEventListener" "addEventListener(\"click\", FUNCTION , false);" nil :system t)
    ("forEach" "forEach(FUNCTION▮ , contexObject);" nil :system t)

    )

  "abbrev table for `xah-js-mode'"
  :case-fixed t
  )


(defvar xjs-keyword-builtin nil "a list of js  names")
(setq xjs-keyword-builtin '(
"break"
"case"
"catch"
"continue"
"debugger"
"default"
"delete"
"do"
"else"
"finally"
"for"
"function"
"if"
"in"
"instanceof"
"new"
"return"
"switch"
"this"
"throw"
"try"
"typeof"
"var"
"void"
"while"
"with") )

(defvar xjs-js-lang-words nil "a list of JavaScript keywords.")
(setq xjs-js-lang-words '(

"call"
"isExtensible"
"preventExtensions"
"getOwnPropertyDescriptor"
"isSealed"
"isFrozen"
"freeze"

"substring"

"JSON"
"Number"
"Object"
"Math"
"Array"
"Boolean"
"Date"
"Error"
"Function"

"Object.keys" ; hack. todo
"insertBefore" ; hack. todo

"EvalError"
"RangeError"
"ReferenceError"
"RegExp"
"String"
"SyntaxError"
"TypeError"
"URIError"
"abstract"
"arguments"
"boolean"
"byte"
"char"
"class"
"const"
"decodeURI"
"decodeURIComponent"
"double"
"encodeURI"
"encodeURIComponent"
"enum"
"eval"
"export"
"extends"
"final"
"float"
"goto"
"implements"
"import"
"int"
"interface"
"isFinite"
"isNaN"
"let"
"long"
"native"
"package"
"parseFloat"
"parseInt"
"private"
"protected"
"public"
"short"
"static"
"super"
"synchronized"
"throws"
"transient"
"undefined"
"volatile"
"yield"

"alert"

"writable"
"enumerable"
"configurable"

;; --------------------

"toString"

"create"
"getPrototypeOf"
"isPrototypeOf"
"defineProperty"
"value"

"prototype"

"getOwnPropertyNames"
"hasOwnProperty"

"apply"
"arguments"

"constructor"
"length"

"JSON.stringify"

) )

(defvar xjs-js-array-methods nil "a list of JavaScript array methods.")
(setq xjs-js-array-methods '(
"concat"
"every"
"filter"
"forEach"
"indexOf"
"join"
"lastIndexOf"
"length"
"map"
"pop"
"push"
"reduce"
"reduceRight"
"reverse"
"shift"
"slice"
"some"
"sort"
"splice"
"toLocalString"
"isArray"
"unshift"
) )

(defvar xjs-js-str-methods nil "a list of JavaScript string methods.")
(setq xjs-js-str-methods '(
"length"
"concat"
"trim"
"slice"
"substr"
"substring"
"indexOf"
"lastIndexOf"
"search"
"replace"
"match"
"split"
"toUpperCase"
"toLowerCase"
"toLocaleUpperCase"
"toLocaleLowerCase"
"charAt"
"charCodeAt"

"toValueOf"
"localeCompare"
) )

(defvar xjs-js-math-methods nil "a list of JavaScript Math methods.")
(setq xjs-js-math-methods '(
"Math.abs"
"Math.acos"
"Math.acosh"
"Math.asin"
"Math.asinh"
"Math.atan"
"Math.atanh"
"Math.atan2"
"Math.cbrt"
"Math.ceil"
"Math.clz32"
"Math.cos"
"Math.cosh"
"Math.exp"
"Math.expm1"
"Math.floor"
"Math.fround"
"Math.hypot"
"Math.imul"
"Math.log"
"Math.log1p"
"Math.log10"
"Math.log2"
"Math.max"
"Math.min"
"Math.pow"
"Math.random"
"Math.round"
"Math.sign"
"Math.sin"
"Math.sinh"
"Math.sqrt"
"Math.tan"
"Math.tanh"
"Math.toSource"
"Math.trunc"
) )

(defvar xjs-dom-words nil "a list of keywords from DOM or browser.")
(setq xjs-dom-words '(

"location"

"window"
"children"
"nodeName"
"tagName"
"querySelectorAll"
"style"
"setAttribute"
"createTextNode"

"addEventListener"
"removeEventListener"
"getElementById"
"getElementsByTagName"
"getElementsByClassName"

"onmouseover"

"setTimeout"
"setInterval"

"console.log"
"createElement"
"createElementNS"
"innerHTML"
"hasChildNodes"
"childNodes"
"removeChild"
"replaceChild"
"document"

"previousSibling"
"nextSibling"
"firstChild"
"lastChild"
"parentNode"

"documentElement"
"clientWidth"
"clientHeight"

".pageXOffset"
".pageYOffset"

".innerWidth"
".innerHeight"

"appendChild"

"getBoundingClientRect"
"nodeValue"
) )

(defvar xjs-constants nil "a list of constants")
(setq xjs-constants '(
"NaN"
"Infinity"
"null"
"undefined"
"true"
"false"
"Math.E"
"Math.LN2"
"Math.LN10"
"Math.LOG2E"
"Math.LOG10E"
"Math.PI"
"Math.SQRT1_2"
"Math.SQRT2"
) )

(defvar xjs-js-vars-1 nil "a list js variables names")
(setq xjs-js-vars-1 '(
) )

(defvar xjs-all-js-keywords nil "a list all js words.")
(setq xjs-all-js-keywords
      (append xjs-keyword-builtin
              xjs-js-lang-words
              xjs-js-array-methods
              xjs-js-str-methods
              xjs-js-math-methods
              xjs-dom-words
              xjs-constants
              xjs-js-vars-1
              )
      )


;; syntax coloring related

(setq xjs-font-lock-keywords
      (let (
          (jsMathMethods (regexp-opt xjs-js-math-methods 'symbols) )
          (domWords (regexp-opt xjs-dom-words) )
          (jsBuildins (regexp-opt xjs-keyword-builtin 'symbols) )
          (jsLangWords (regexp-opt xjs-js-lang-words 'symbols) )
          (jsVars1 (regexp-opt xjs-js-vars-1 'symbols) )
          (jsArrayMethods (regexp-opt xjs-js-array-methods 'symbols) )
          (jsStrMethods (regexp-opt xjs-js-str-methods 'symbols) )
          (jsConstants (regexp-opt xjs-constants 'symbols) )
          )
        `(
          (,jsMathMethods . font-lock-type-face)
          (,jsConstants . font-lock-constant-face)
          (,domWords . font-lock-function-name-face)
          (,jsBuildins . font-lock-keyword-face)
          (,jsLangWords . font-lock-keyword-face)
          (,jsArrayMethods . font-lock-keyword-face)
          (,jsStrMethods . font-lock-keyword-face)
          (,jsVars1 . font-lock-variable-name-face)
          ) ) )

;; fontfont-lock-builtin-face
;; font-lock-comment-delimiter-face
;; font-lock-comment-face
;; font-lock-constant-face
;; font-lock-doc-face
;; font-lock-function-name-face
;; font-lock-keyword-face
;; font-lock-negation-char-face
;; font-lock-preprocessor-face
;; font-lock-reference-face
;; font-lock-string-face
;; font-lock-syntactic-face-function
;; font-lock-type-face
;; font-lock-variable-name-face
;; font-lock-warning-face


;; keybinding

(defvar xjs-keymap nil "Keybinding for `xah-js-mode'")
(progn
  (setq xjs-keymap (make-sparse-keymap))
  (define-key xjs-keymap (kbd "<menu> e TAB") 'xjs-complete-symbol-ido)
  )


;; syntax table

(defvar xjs-syntax-table nil "Syntax table for `xah-js-mode'.")

(setq xjs-syntax-table
      (let ((synTable (make-syntax-table)))

        (modify-syntax-entry ?\/ "< 124b" synTable)
        (modify-syntax-entry ?* "< 23" synTable)
        (modify-syntax-entry ?\n "> b" synTable)

        (modify-syntax-entry ?\! "." synTable)
        (modify-syntax-entry ?\" "\"" synTable)
        (modify-syntax-entry ?\# "." synTable)
        (modify-syntax-entry ?\$ "." synTable)
        (modify-syntax-entry ?\% "." synTable)
        (modify-syntax-entry ?\& "." synTable)
        (modify-syntax-entry ?\' "\"" synTable)
        (modify-syntax-entry ?\( "()" synTable)
        (modify-syntax-entry ?\) ")(" synTable)
        (modify-syntax-entry ?\* "." synTable)
        (modify-syntax-entry ?\+ "." synTable)
        (modify-syntax-entry ?\, "." synTable)
        (modify-syntax-entry ?\- "." synTable)
        (modify-syntax-entry ?\. "." synTable)
        (modify-syntax-entry '(?0 . ?9) "w" synTable)
        (modify-syntax-entry ?\: "." synTable)
        (modify-syntax-entry ?\; "." synTable)
        (modify-syntax-entry ?\< "." synTable)
        (modify-syntax-entry ?\= "." synTable)
        (modify-syntax-entry ?\> "." synTable)
        (modify-syntax-entry ?\? "." synTable)
        (modify-syntax-entry ?\@ "." synTable)
        (modify-syntax-entry '(?A . ?Z) "w" synTable)
        (modify-syntax-entry ?\[ "(]" synTable)
        (modify-syntax-entry ?\\ "\\" synTable)
        (modify-syntax-entry ?\] ")[" synTable)
        (modify-syntax-entry ?^ "." synTable) ; can't use blackslash, because it became control
        (modify-syntax-entry ?\_ "_" synTable)
        (modify-syntax-entry ?\` "." synTable)
        (modify-syntax-entry '(?a . ?z) "w" synTable)
        (modify-syntax-entry ?\{ "(}" synTable)
        (modify-syntax-entry ?\| "." synTable)
        (modify-syntax-entry ?\} "){" synTable)
        (modify-syntax-entry ?\~ "." synTable)

        synTable))

;; tired of syntax table. major steal
  (require 'cc-mode)     ; (only) for `c-populate-syntax-table'
(setq xjs-syntax-table (let ((table (make-syntax-table))) (c-populate-syntax-table table) table))


;; indent

(defun xjs-complete-or-indent ()
  ""
  (interactive)
  (js-indent-line)
)

(defun xjs-complete-symbol-ido ()
  "Perform keyword completion on current word.

This uses `ido-mode' user interface style for completion."
  (interactive)
  (let* (
         (bds (bounds-of-thing-at-point 'symbol))
         (p1 (car bds) )
         (p2 (cdr bds) )
         (currentWord (buffer-substring-no-properties p1 p2) )

         finalResult)
    (when (not currentWord) (setq currentWord ""))
    (setq finalResult
          (ido-completing-read "" xjs-all-js-keywords nil nil currentWord )
          )
    (delete-region p1 p2)
    (insert finalResult)
    ))



;; define the mode
(defun xah-js-mode ()
  "A major mode for JavaScript.

\\{xjs-keymap}"
  (interactive)
  (kill-all-local-variables)

  (setq mode-name "∑js")
  (setq major-mode 'xah-js-mode)

  (setq font-lock-defaults '((xjs-font-lock-keywords)))

  (set-syntax-table xjs-syntax-table)
  (use-local-map xjs-keymap)

  (setq-local comment-start "//")
  (setq-local comment-end "")
  (setq-local comment-column 2)

  (setq-local indent-line-function 'xjs-complete-or-indent)
  (setq-local tab-always-indent 'complete)
  (add-hook 'completion-at-point-functions 'xjs-complete-symbol-ido nil 'local)

  (setq indent-tabs-mode nil) ; don't mix space and tab
  (setq tab-width 1)

  (setq local-abbrev-table xjs-abbrev-table)

  (run-mode-hooks 'xah-js-mode-hook)

  :syntax-table xjs-syntax-table

  )

(provide 'xah-js-mode)
