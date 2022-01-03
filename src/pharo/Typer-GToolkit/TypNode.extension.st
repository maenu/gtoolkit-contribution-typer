Extension { #name : #TypNode }

{ #category : #'*Typer-GToolkit' }
TypNode >> gtGraphFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  | outs ins edges nodes |
			  outs := outgoing asArray takeFirst: 16.
			  ins := incoming asArray takeFirst: 16.
			  nodes := (outs collect: #target) , (ins collect: #origin)
			           , { self }.
			  edges := nodes flatCollect: #edges.
			  m nodes
				  stencil: [ :e | e asElementIn: m ];
				  with: nodes.
			  m edges
				  stencil: [ :e | e asElementIn: m ];
				  connect: edges from: #origin to: #target.
			  m layout custom: TypGtGraphForceBasedLayout new.
			  m ]
]
