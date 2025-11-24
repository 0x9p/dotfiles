(setq doom-theme 'doom-one)
(setq doom-font (font-spec :family "JetBrains Mono" :size 15))

(custom-theme-set-faces!
'doom-one
'(org-level-8 :inherit outline-3 :height 1.0)
'(org-level-7 :inherit outline-3 :height 1.0)
'(org-level-6 :inherit outline-3 :height 1.1)
'(org-Level-5 :inherit outline-3 :height 1.2)
'(org-Level-4 :inherit outline-3 :height 1.3)
'(org-level-3 :inherit outline-3 :height 1.4)
'(org-level-2 :inherit outline-2 :height 1.5)
'(org-level-1 :inherit outline-1 :height 1.6)
'(org-document-title :height 1.8 :bold t :underline nil))

(setq org-directory "~/org/")
(setq org-modern-table-vertical 1)
(setq org-modern-table t)

(setq-default eglot-workspace-configuration (quote (:gopls (:hints (:parameterNames t)))))

(setq confirm-kill-emacs nil)
