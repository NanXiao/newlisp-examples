#!/usr/local/bin/newlisp
(set 'arglist (main-args))
(while (> (length arglist) 2)
	(set 'file (pop arglist -1))
	(println "Processing " file)
	(set 'handle (open file "u"))
	(set 'chr (read-char handle))
	(set 'newchr 0x6c)
	(if (= chr 0xD4) (seek handle 20) (seek handle 23))
	(write-char handle newchr)
	(close handle)
)

(exit)