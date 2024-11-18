(use-package wanderlust 
  :straight t
  :init
  (autoload 'wl "wl" "Wanderlust" t)
  (autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
  (autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
  (setq wl-message-id-domain "user@gmail.com")
)

;; UTF-8
(setq-default mime-charset-for-write 'utf-8)
  (setq-default mime-transfer-level 8)
  (setq charsets-mime-charset-alist
        '(((ascii) . us-ascii)
          ((unicode) . utf-8)))

;; SMTP Settings
(setq wl-smtp-connection-type   'starttls)
(setq wl-smtp-posting-port      587)        
(setq wl-smtp-authenticate-type "plain")           
(setq wl-smtp-posting-user      "user@gmail.com")
(setq wl-smtp-posting-server    "smtp.gmail.com")
(setq wl-local-domain           "linvirt.com")
(setq wl-message-id-domain      "smtp.gmail.com") 
(setq wl-folder-check-async t)
(setq wl-default-folder "%inbox")
(setq wl-draft-folder "%[Gmail]/Drafts")
(setq wl-trash-folder "%[Gmail]/Trash")
(setq wl-from "Full Username <user@gmail.com>")  
(setq wl-fcc-force-as-read t)
(setq wl-default-spec "%")

;; IMAP Settings 
(setq elmo-imap4-use-modified-utf7 t)
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "user@gmail.com")
(setq elmo-imap4-default-authenticate-type 'clear)
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)
             
;; Fields and Files
(setq elmo-msgdb-path-encode-threshold 128)

(setq wl-message-truncate-lines nil
      wl-summary-width nil
      wl-forward-subject-prefix "Fwd: "
      wl-message-ignored-field-list
      '(".*Received:"
        ".*Path:"
        ".*Id:"
        "^References:"
        "^Replied:"
        "^Errors-To:"
        "^Mail-.*-To:"
        "^Lines:"
        "^Sender:"
        ".*Host:"
        "^Xref:"
        "^Content-Type:"
        "^Precedence:"
        "^Status:"
        "^X.*:"
        "^MIME.*:"
        "^In-Reply-To:"
        "^Content-Transfer-Encoding:"
        "^Content-Disposition:"
        "^List-.*:"
        "^Received-SPF:"
        "^DKIM-.*:"
        "^DomainKey-.*:"
        "^SPF-.*:"
        "^Autocrypt:"
        "^ARC-.*:"
        "^Authentication-Results:"
        "^UI-.*:"
        "^IronPort.*:")
      wl-message-visible-field-list
      '("^Message-Id:"
        "^User-Agent:"
        "^X-Mailer:"
        "^X-Face:")
)

 (autoload 'wl-user-agent-compose "wl-draft" nil t)
 (if (boundp 'mail-user-agent)
   (setq mail-user-agent 'wl-user-agent))
 (if (fboundp 'define-mail-user-agent)
   (define-mail-user-agent
     'wl-user-agent
     'wl-user-agent-compose
     'wl-draft-send
     'wl-draft-kill
     'mail-send-hook))

(provide 'lv-wanderlust)
