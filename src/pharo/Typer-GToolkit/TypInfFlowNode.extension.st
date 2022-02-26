Extension { #name : #TypInfFlowNode }

{ #category : #'*Typer-GToolkit' }
TypInfFlowNode >> typGtAsElementIn: aMondrian [

	^ self
		  typGtDecorate:
			  (GtPharoSnippetCoder forSource: node formattedCode)
				  asCoderViewModel collapse asElement hFitContent
		  in: aMondrian
]

{ #category : #'*Typer-GToolkit' }
TypInfFlowNode >> typGtFlowFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Control Flow';
		  priority: 10;
		  painting: [ :m | self typGtFlowPaintOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypInfFlowNode >> typGtFlowPaintOn: aMondrian [

	| edges nodes currentNodes nextNodes |
	currentNodes := aMondrian existingNodes.
	nodes := self flowNodesAll difference: currentNodes.
	nodes ifEmpty: [ ^ self ].
	nextNodes := currentNodes , nodes , { self }.
	edges := ((((nodes flatCollect: #flowIncoming) select: [ :e | 
		            nextNodes includes: e origin ])
	           , ((nodes flatCollect: #flowOutgoing) select: [ :e | 
			            nextNodes includes: e target ])) asIdentitySet asArray 
		          groupedBy: #nodes) values asArray sort: [ :a :b | 
		         a size > b size ].
	nodes := (edges flatCollect: [ :e | e flatCollect: #nodes ])
		         asIdentitySet difference: currentNodes.
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		stencil: [ :e | e anyOne typGtAsElementIn: aMondrian with: e ];
		connect: edges
		from: [ :e | e anyOne origin ]
		to: [ :e | e anyOne target ].
	aMondrian layout force
]

{ #category : #'*Typer-GToolkit' }
TypInfFlowNode >> typGtSourceCodeFor: aView [

	<gtView>
	^ aView forward
		  title: 'Node';
		  priority: 1;
		  object: [ node ];
		  view: #gtSourceCodeFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfFlowNode >> typGtSourceFor: aView [

	<gtView>
	node methodNode ifNil: [ ^ aView empty ].
	node methodNode compiledMethod ifNil: [ ^ aView empty ].
	^ aView forward
		  title: 'Method';
		  priority: 2;
		  object: [ node methodNode compiledMethod ];
		  view: #gtSourceFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfFlowNode >> typGtTypeFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: (state at: self) ]
]
