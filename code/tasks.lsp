#!/usr/local/bin/newlisp

;;

(import "libc.so" "sysconf")

(constant '_SC_NPROCESSORS_ONLN 503)

(define (report pid)
    (println "process: " pid " has returned"))

(define cpu-num (sysconf _SC_NPROCESSORS_ONLN))

(set 'result-array cpu-num)

(dotimes (i cpu-num)
	(spawn 'p (println i)))
	
(until (true? (sync 10 report)))

(exit)


