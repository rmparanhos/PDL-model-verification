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
    ))

(define a (new vertex%[id "a"]))
(define v (new vertex%[id "v"]))
(send a get-id)
(send v get-id)

(define e (new edge%[label "a-v"][vertex_1 a][vertex_2 v]))
(send e get-label)
(send e get-vertex_1)
(send e get-vertex_2)

(define ww (new w%[vertex_l (list a v)]))
(send ww get-vertex_l)