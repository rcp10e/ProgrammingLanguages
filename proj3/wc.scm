(define filestatistics_helper
	(lambda (srcf topWords charcount wordcount linecount) 
		(if (eof-object? (peek-char srcf))
			(begin
				(close-port srcf)
				(display charcount) 
				(display #\space)
				(display wordcount)
				(display #\space)
				(display linecount)
				(display #\newline)
				(display "Top")
				(display #\space)
				(display topWords)
				(display #\space)
				(display "word(s):")
						()
      			)
			(begin
				(if (char=? (peek-char srcf) #\space)
						(set! wordcount (+ wordcount 1))
						()
				)
				(if (char=? (peek-char srcf) #\tab)
						(set! wordcount (+ wordcount 1))
						()
				)
				(if (char=? (peek-char srcf) #\newline)
						(begin
							(set! wordcount (+ wordcount 1))
						 	(set! linecount (+ linecount 1))
						)
						()
				)
				(read-char srcf)
				(filestatistics_helper srcf topWords (+ charcount 1) wordcount linecount)
						
				
			)
		)
	)
)



(define filestatistics
	(lambda (srcf topWords)
		(let ((file (open-input-file srcf)))
			(filestatistics_helper file topWords 0 0 0)
		)
	)
)
