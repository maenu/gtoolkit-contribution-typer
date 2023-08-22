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
				   size: 8 @ 8;
				   yourself)
		  in: aMondrian
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtCompactFlowFor: aView [
	<gtView>
	^ aView typGtMondrian
		title: 'Compact Flow';
		priority: 10;
		painting: [ :m | self typGtCompactFlowOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtCompactFlowOn: aMondrian [
	| nodes edges changed |
	nodes := context nodes values flatCollect: #yourself.
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
				whileFalse: [ | edge |
					edge := queue removeFirst.
					(edge target isKindOf: TypInfInlinedMethod)
						ifFalse: [ edges
								detect: [ :e | 
									e origin == edge target
										and: [ (edges select: [ :f | f origin == edge target ]) size = 1
												and: [ (edges select: [ :f | f target == edge target ]) size = 1 ] ] ]
								ifFound: [ :e | 
									| next |
									changed := true.
									next := TypInfNextEdge origin: edge origin target: e target.
									queue
										remove: e ifAbsent: [  "noop" ];
										add: next.
									edges
										remove: edge ifAbsent: [  "noop" ];
										remove: e ifAbsent: [  "noop" ];
										add: next ]
								ifNone: [  "noop" ] ] ] ].
	nodes := edges flatCollect: #nodes.
	"edges := edges
			, (nodes
					flatCollect: [ :n | 
						n edges
							select: [ :e | (nodes includes: e origin) and: [ nodes includes: e target ] ] ]
					as: IdentitySet)."
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		connect: edges
			from: #origin
			to: #target.
	aMondrian layout force
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtDecorate: anElement in: aMondrian [
	anElement
		when: BlMouseDownEvent do: [ anElement zIndex: 1 ];
		when: BlClickEvent do: [ anElement phlow spawnObject: self ].
	anElement
		addAptitude: (TypGtStrongBorderAptitude color: self typGtColor)
				+ (BrGlamorousWithTooltipAptitude
						content: [ BrEditor new
								aptitude: BrGlamorousCodeEditorAptitude new;
								background: BlBackground transparent;
								text: self class name , String lf
										, (state at: self ifAbsent: [ TypUnknownType instance ]) asString
										, String lf , node formattedCode;
								beReadOnlyWithoutSelection;
								hFitContent;
								vFitContent;
								yourself ]).
	^ anElement
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
	| edges nodes |
	nodes := self allNextNodes.
	nodes ifEmpty: [ ^ self ].
	edges := (((nodes flatCollect: #inEdges)
			select: [ :e | nodes includes: e origin ])
			, ((nodes flatCollect: #outEdges) select: [ :e | nodes includes: e target ]))
			asIdentitySet groupedBy: [ :e | e key -> e nodes ].
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		stencil: [ :e | e anyOne typGtAsElementIn: aMondrian with: e ];
		connect: (edges associations
					select: [ :e | e key key = #next ]
					thenCollect: #value)
			from: [ :e | e anyOne origin ]
			to: [ :e | e anyOne target ].
	aMondrian edges
		passive;
		stencil: [ :e | e anyOne typGtAsElementIn: aMondrian with: e ];
		connect: (edges associations
					reject: [ :e | e key key = #next ]
					thenCollect: #value)
			from: [ :e | e anyOne origin ]
			to: [ :e | e anyOne target ].
	aMondrian layout force
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtInlineFlowOn: aMondrian [
	| nodes edges changed |
	nodes := context nodes values flatCollect: #yourself.
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
				whileFalse: [ | edge |
					edge := queue removeFirst.
					edges
						detect: [ :e | 
							e origin == edge target
								and: [ (edges select: [ :f | f origin = e origin ]) size = 1
										and: [ (edges select: [ :f | f origin = edge target ]) size = 1 ] ] ]
						ifFound: [ :e | 
							changed := true.
							queue remove: e ifAbsent: [  "noop" ].
							edges
								remove: edge ifAbsent: [  "noop" ];
								remove: e ifAbsent: [  "noop" ];
								add: (TypInfNextEdge origin: edge origin target: e target) ]
						ifNone: [  "noop" ] ] ].
	nodes := edges flatCollect: #nodes.
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		connect: edges
			from: #origin
			to: #target.
	aMondrian layout force
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtMinimalFlowFor: aView [
	<gtView>
	^ aView typGtMondrian
		title: 'Minimal Flow';
		priority: 10;
		painting: [ :m | self typGtMinimalFlowOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypInfNode >> typGtMinimalFlowOn: aMondrian [
	| nodes edges changed |
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
	edges := edges
			, (nodes
					flatCollect: [ :n | 
						n edges
							select: [ :e | (nodes includes: e origin) and: [ nodes includes: e target ] ] ]
					as: IdentitySet).
	aMondrian nodes
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		with: nodes.
	aMondrian edges
		stencil: [ :e | e typGtAsElementIn: aMondrian ];
		connect: edges
			from: #origin
			to: #target.
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
