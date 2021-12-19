Extension { #name : #TypNode }

{ #category : #'*Typer-GToolkit' }
TypNode >> gtGraphOn: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  | edges nodes |
			  edges := outgoing , incoming.
			  nodes := (outgoing collect: #target)
			           , (incoming collect: #origin) , { self }.
			  m nodes
				  stencil: [ :e | e asElementIn: m ];
				  with: nodes.
			  m edges
				  stencil: [ :e | e asElementIn: m ];
				  connect: edges from: #origin to: #target.
			  m layout custom: TypGtGraphForceBasedLayout new.
			  m ]
]
