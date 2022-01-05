Extension { #name : #TypNode }

{ #category : #'*Typer-GToolkit' }
TypNode >> gtGraphFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | 
			  | edges nodes |
			  nodes := (((outgoing asArray takeFirst: 16) collect: #target)
			            , ((incoming asArray takeFirst: 16) collect: #origin)
			            , { self }) asSet.
			  edges := (((nodes asIdentitySet flatCollect: #edges) select: [ :e | 
					             nodes includesAll: e nodes ]) groupedBy: #nodes)
				           values.
			  edges := edges asArray takeFirst: 64.
			  m nodes
				  stencil: [ :e | e asElementIn: m ];
				  with: nodes.
			  m edges
				  stencil: [ :e | e anyOne asElementIn: m with: e ];
				  connect: edges
				  from: [ :e | e anyOne origin ]
				  to: [ :e | e anyOne target ].
			  m layout force ]
]
