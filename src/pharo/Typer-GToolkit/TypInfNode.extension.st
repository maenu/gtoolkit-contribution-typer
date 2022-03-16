Extension { #name : #TypInfNode }

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtAsElementIn: aMondrian [

	^ self
		  typGtDecorate:
			  (GtPharoSnippetCoder forSource: node formattedCode)
				  asCoderViewModel collapse asElement hFitContent
		  in: aMondrian
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtFlowFor: aView [

	<gtView>
	^ aView typGtMondrian 
		  title: 'Control Flow'; 
		  priority: 10;
		  painting: [ :m | self typGtFlowPaintOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtFlowPaintOn: aMondrian [

	| edges nodes currentNodes nextNodes |
	currentNodes := aMondrian existingNodes.
	nodes := (self context outgoingEdges collect: #target) difference:
		         currentNodes.
	nodes ifEmpty: [ ^ self ].
	nextNodes := currentNodes , nodes , { self }.
	edges := ((((nodes flatCollect: #incomingEdges) select: [ :e | 
		            nextNodes includes: e origin ])
	           , ((nodes flatCollect: #outgoingEdges) select: [ :e | 
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
	aMondrian edges
		passive;
		stencil: [ :e | e typGtAsElementIn: aMondrian with: { e } ];
		connect:
			((nodes flatCollect: #outgoingEdges) select: [ :e | 
					 e key = #tighten ])
		from: [ :e | e origin ]
		to: [ :e | e target ].
	aMondrian layout force
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtSourceCodeFor: aView [

	<gtView>
	^ aView forward
		  title: 'Node';
		  priority: 1;
		  object: [ node ];
		  view: #gtSourceCodeFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtSourceFor: aView [

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
TypInfNode >> typGtStateFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView forward
		  title: 'State';
		  priority: 10;
		  object: [ state ];
		  view: #typGtItemsFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtTypeFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: self type ]
]