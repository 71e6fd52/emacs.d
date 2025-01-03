;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq tab-always-indent 'complete)

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package company
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :bind (:map company-active-map
              ([tab] . company-complete-selection)
              ("M-/" . company-other-backend)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("M-." . company-show-location))
  :custom
  (company-idle-delay 0.1)
  (company-minimum-prefix-length 1))


(use-package company-box
  :if (display-graphic-p)
  :after company
  :diminish company-box-mode
  :hook (company-mode . company-box-mode))

(provide 'init-company)
;;; init-company.el ends here
