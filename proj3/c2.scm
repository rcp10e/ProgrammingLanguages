(define filestatistics
          (lambda (srcf)
            (if (eof-object? (peek-char srcf ) )
                  (begin
                     (close-port srcf)
                     0
                  )
                (begin
                  (read-char srcf)
                  (+ (filestatistics srcf) 1)
                )
            )
         )
)

(define wc
  (lambda (src)
    (let ((file (open-input-file src)))
       (display (filestatistics file))
       (newline)
       ()
    )
  )
)
