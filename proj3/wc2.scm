(define filestatistics_helper
	(lambda (srcf topWords charcount wordcount linecount) 
		(if (eof-object? (peek-char srcf))
			(begin
				(close-port srcf)
				(display linecount) 
				(display #\space)
				(display wordcount)
				(display #\space)
				(display charcount)
				(display #\newline)
				(display "Top")
				(display #\space)
				(display topWords)
				(display #\space)
				(display "word(s):")
						()
      			)
			(begin
				
				(read-char srcf)
				(filestatistics_helper  srcf 

							topWords
 
							(+ charcount 1)
 
							(if (not (eof-object? (peek-char srcf)))
								(if (or (char=? (peek-char srcf) #\space) (or (char=? (peek-char srcf) #\newline) (char=? (peek-char srcf) #\tab)))
									(+ wordcount 1)
									(+ wordcount 0)
								)
								(+ wordcount 0)
							)
								
							(if (not (eof-object? (peek-char srcf)))
								(if (char=? (peek-char srcf) #\newline)
									(+ linecount 1)
									(+ linecount 0)
								)
								(+ linecount 0)
							)
				)
				
			)
		)
	)
)



(define filestatistics
	(lambda (srcf topWords)
		(let ((file (open-input-file srcf)))
			(filestatistics_helper file topWords 0 0 0 )
		)
	)
)
