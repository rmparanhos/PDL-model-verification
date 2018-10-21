#lang racket

(define vertex%
  (class object%
    (init id)                ; initialization argument
 
    (define this_id id)      ; field
 
    (super-new)              ; superclass initialization
 
    (define/public (get-id)
      this_id)
    ))

(define edge%
  (class object%
    (init label vertex_1 vertex_2)                ; initialization argument
 
    (define this_label label)      ; field
    (define this_vertex_1 vertex_1)
    (define this_vertex_2 vertex_2)

    (super-new)              ; superclass initialization
 
    (define/public (get-label)
      this_label)
    (define/public (get-vertex_1)
      this_vertex_1)
    (define/public (get-vertex_2)
      this_vertex_2)
    
    ))

(define w%
  (class object%
    (init vertex_l)                ; initialization argument
 
    (define this_vertex_l vertex_l)      ; field
 
    (super-new)              ; superclass initialization
 
    (define/public (get-vertex_l)
      this_vertex_l)
    ))

(define ra%
  (class object%
    (init edge_l)                ; initialization argument
 
    (define this_edge_l edge_l)      ; field
 
    (super-new)              ; superclass initialization
 
    (define/public (get-edge_l)
      this_edge_l)
    ))

(define frame_pdl%
  (class object%
    (init w ra)                ; initialization argument
 
    (define this_w w)      ; field
    (define this_ra ra)      ; field
    (super-new)              ; superclass initialization
 
    (define/public (get-w)
      this_w)
    (define/public (get-ra)
      this_ra)
    
    (define/public (print-graph)
      (for ([i this_w]) ; iterator binding
         (println (send i get-id))) ; body
       )
    )
 )

(define program%
  (class object%
    (init text)                ; initialization argument
 
    (define this_text text)      ; field

    (super-new)              ; superclass initialization
 
    (define/public (get-text)
      this_text)
    ))


;pagina 113, apostila de pdl
(define s (new vertex%[id "s"]))
(define t (new vertex%[id "t"]))
(define u (new vertex%[id "u"]))
(define v (new vertex%[id "v"]))

(define t_v (new edge%[label "a"][vertex_1 t][vertex_2 v]))
(define v_t (new edge%[label "a"][vertex_1 v][vertex_2 t]))
(define s_u (new edge%[label "a"][vertex_1 s][vertex_2 u]))
(define u_s (new edge%[label "a"][vertex_1 u][vertex_2 s]))
(define u_v (new edge%[label "b"][vertex_1 u][vertex_2 v]))
(define v_u (new edge%[label "b"][vertex_1 v][vertex_2 u]))
(define s_t (new edge%[label "b"][vertex_1 s][vertex_2 t]))
(define t_s (new edge%[label "b"][vertex_1 t][vertex_2 s]))

(define f (new frame_pdl%[w (list s t u v )][ra (list t_v v_t s_u u_s u_v v_u s_t t_s)]))
(send f print-graph)
