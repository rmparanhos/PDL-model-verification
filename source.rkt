#lang racket

(define vertex%
  (class object%
    (init id)                ; initialization argument
 
    (define this-id id)      ; field
 
    (super-new)              ; superclass initialization
 
    (define/public (get-id)
      this-id)

    (define/public (print-vertex)
      this-id)
    
    )
  )

(define edge%
  (class object%
    (init label vertex-1 vertex-2)                ; initialization argument
 
    (define this-label label)      ; field
    (define this-vertex-1 vertex-1)
    (define this-vertex-2 vertex-2)

    (super-new)              ; superclass initialization
 
    (define/public (get-label)
      this-label)
    (define/public (get-vertex-1)
      this-vertex-1)
    (define/public (get-vertex-2)
      this-vertex-2)

    
    (define/public (print-edge)
        (print this-label)
        (print (send this-vertex-1 print-vertex))
        (print (send this-vertex-2 print-vertex))
    )
    
  )
)

(define w%
  (class object%
    (init vertex-l)                ; initialization argument
 
    (define this-vertex-l vertex-l)      ; field
 
    (super-new)              ; superclass initialization
 
    (define/public (get-vertex-l)
      this-vertex-l)

    
    (define/public (print-vertex-l)
      (for ([i this-vertex-l]) ; iterator binding
         (println (send i print-vertex))) ; body
       )
    
    ))

(define ra%
  (class object%
    (init edge-l)                ; initialization argument
 
    (define this-edge-l edge-l)      ; field
 
    (super-new)              ; superclass initialization
 
    (define/public (get-edge-l)
      this-edge-l)
    
    (define/public (print-edge-l)
      (for ([i this-edge-l]) ; iterator binding
         (println (send i print-edge))) ; body
       )
    )
  )

(define frame-pdl%
  (class object%
    (init w ra)                ; initialization argument
 
    (define this-w w)      ; field
    (define this-ra ra)      ; field
    (super-new)              ; superclass initialization
 
    (define/public (get-w)
      this-w)
    (define/public (get-ra)
      this-ra)
    
    (define/public (print-frame-pdl)
      (send this-w print-vertex-l)
      (send this-ra print-edge-l)
       )
    )
 )

(define program%
  (class object%
    (init text)                ; initialization argument
 
    (define this-text text)      ; field

    (super-new)              ; superclass initialization
 
    (define/public (get-text)
      this-text)
    ))


;pagina 113, apostila de pdl
(define s (new vertex%[id "s"]))
(define t (new vertex%[id "t"]))
(define u (new vertex%[id "u"]))
(define v (new vertex%[id "v"]))

(define t-v (new edge%[label "a"][vertex-1 t][vertex-2 v]))
(define v-t (new edge%[label "a"][vertex-1 v][vertex-2 t]))
(define s-u (new edge%[label "a"][vertex-1 s][vertex-2 u]))
(define u-s (new edge%[label "a"][vertex-1 u][vertex-2 s]))
(define u-v (new edge%[label "b"][vertex-1 u][vertex-2 v]))
(define v-u (new edge%[label "b"][vertex-1 v][vertex-2 u]))
(define s-t (new edge%[label "b"][vertex-1 s][vertex-2 t]))
(define t-s (new edge%[label "b"][vertex-1 t][vertex-2 s]))

(define w1 (new w%[vertex-l (list s t u v)]))
(define ra1 (new ra%[edge-l (list t-v v-t s-u u-s u-v v-u s-t t-s)]))
;(send w1 print-vertex-l)
;(send ra1 print-edge-l) 

(define f (new frame-pdl%[w w1][ra ra1]))
(send f print-frame-pdl)
