Extension { #name : #TypNode }

{ #category : #'*Typer-GToolkit' }
TypNode >> gtGraphOn: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  | nodes edges |
			  nodes := IdentitySet new.
			  edges := IdentitySet new.
			  (self withAllIncoming asOrderedCollection takeFirst: 32) do: [ :e | 
					  nodes add: e.
					  edges addAll: e outgoing ].
			  (self withAllOutgoing asOrderedCollection takeFirst: 32) do: [ :e | 
					  nodes add: e.
					  edges addAll: e incoming ].
			  m nodes
				  stencil: [ :e | e asElementIn: m ];
				  with: nodes.
			  m edges
				  stencil: [ :e | e asElementIn: m ];
				  connect: edges from: #origin to: #target.
			  m layout custom: TypGtGraphForceBasedLayout new.
			  m ]
]
