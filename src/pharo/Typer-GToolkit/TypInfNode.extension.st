Extension { #name : #TypInfNode }

{ #category : #'*Typer-GToolkit' }
TypInfNode >> allNextNodes [
	| result |
	result := IdentitySet new.
	self depthFirstNextDo: [ :n | result add: n ].
	^ result
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtAsElementIn: aMondrian [
	"	^ BrEditor new
		  aptitude: BrGlamorousCodeEditorAptitude new;
		  background: BlBackground transparent;
		  text: node formattedCode;
		  beReadOnlyWithoutSelection;
		  hFitContent;
		  vFitContent;
		  yourself"

	^ self
		typGtDecorate: (BlElement new
				size: 10 @ 10;
				geometry: BlCircleGeometry new;
				border: (self typGtBorder: 0.3);
				yourself)
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
	| nodes edges connections |
	nodes := context root allNextNodes.
	edges := (((nodes flatCollect: #inEdges)
			select: [ :e | nodes includes: e origin ])
			, ((nodes flatCollect: #outEdges) select: [ :e | nodes includes: e target ]))
			asIdentitySet.
	connections := (edges groupedBy: [ :e | e origin -> e target ]) associations
			collect: [ :a | a key -> a value asOrderedCollection ]
			as: Dictionary.
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		passive;
		stencil: [ :e | 
			| localEdges |
			localEdges := connections at: e origin -> e target.
			(e typGtAsElementIn: aMondrian)
				curvatureFraction: (localEdges indexOf: e ifAbsent: 0) / (localEdges size * 2 + 1);
				yourself ];
		connect: (edges reject: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian edges
		stencil: [ :e | 
			| localEdges |
			localEdges := connections at: e origin -> e target.
			(e typGtAsElementIn: aMondrian)
				curvatureFraction: (localEdges indexOf: e ifAbsent: 0) / (localEdges size * 2 + 1);
				yourself ];
		connect: (edges select: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian layout force fix: self at: 0 @ 0
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtMinimalFlowFor: aView [
	<gtView>
	^ aView typGtMondrian
		title: 'Minimal Flow';
		priority: 10;
		painting: [ :m | self typGtMinimalFlowPaintOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtMinimalFlowPaintOn: aMondrian [
	| nodes edges changed connections |
	nodes := context root allNextNodes.
	edges := nodes
			flatCollect: [ :n | 
				(n in at: #next ifAbsent: IdentitySet new)
					, (n out at: #next ifAbsent: IdentitySet new) ]
			as: IdentitySet.
	changed := true.
	[ changed ]
		whileTrue: [ | queue |
			changed := false.
			queue := edges asOrderedCollection.
			[ queue isEmpty ]
				whileFalse: [ | a |
					a := queue removeFirst.
					edges
						detect: [ :b | 
							b origin == a target
								and: [ (edges select: [ :c | c origin == a target ]) size = 1
										and: [ (edges select: [ :c | c target == a target ]) size = 1 ] ] ]
						ifFound: [ :b | 
							| next |
							changed := true.
							next := TypInfNextEdge origin: a origin target: b target.
							queue
								remove: a ifAbsent: [  "noop" ];
								remove: b ifAbsent: [  "noop" ];
								add: next.
							edges
								remove: a ifAbsent: [  "noop" ];
								remove: b ifAbsent: [  "noop" ];
								add: next ]
						ifNone: [  "noop" ] ] ].
	nodes := edges flatCollect: #nodes.
	connections := (edges groupedBy: [ :e | e origin -> e target ]) associations
			collect: [ :a | a key -> a value asOrderedCollection ]
			as: Dictionary.
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		passive;
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		connect: (edges reject: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian edges
		stencil: [ :e | 
			| localEdges |
			localEdges := connections at: e origin -> e target.
			(e typGtAsElementIn: aMondrian)
				curvatureFraction: 1 - ((localEdges indexOf: e) / localEdges size);
				yourself ];
		connect: (edges select: [ :e | e key = #next ] thenCollect: #value)
			from: #origin
			to: #target.
	aMondrian layout force fix: self at: 0 @ 0
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
