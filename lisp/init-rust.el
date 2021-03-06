;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'rust-mode)
  (setq rust-format-on-save t)
  (when (maybe-require-package 'company)
    (add-hook 'racer-mode-hook #'company-mode)))

;; (when (maybe-require-package 'flycheck-rust)
;;   (with-eval-after-load 'rust-mode
;;     (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))
(add-hook 'rust-mode-hook (lambda () (setq flycheck-disabled-checkers '(rust rust-cargo rust-clippy))))

(setq lsp-rust-server 'rust-analyzer)
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'lsp-after-open-hook (lambda () (when (lsp-find-workspace 'rust-analyzer nil)
                                       (lsp-rust-analyzer-inlay-hints-mode))))

(provide 'init-rust)
;;; init-rust.el ends here
