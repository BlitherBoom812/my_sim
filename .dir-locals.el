;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((c++-mode . ((compile-command . (concat "cd " (file-name-directory (buffer-file-name))
				  " && cmake . "
					 "&& make -j && ./"
					 (file-name-nondirectory (directory-file-name (file-name-directory (buffer-file-name))))
					 "&& gtkwave "
					 "wave.vcd"))
	      (flycheck-clang-language-standard . "c++11"))))
;; (message "generated file: %s" (file-name-nondirectory (directory-file-name (file-name-directory (buffer-file-name)))))

