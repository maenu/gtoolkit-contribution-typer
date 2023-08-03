Extension { #name : #TypInfNode }

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
										and: [ (edges select: [ :f | f origin == e origin ]) size = 1
												and: [ (edges select: [ :f | f origin == edge target ]) size = 1 ] ] ]
								ifFound: [ :e | 
									changed := true.
									queue remove: e ifAbsent: [  "noop" ].
									edges
										remove: edge ifAbsent: [  "noop" ];
										remove: e ifAbsent: [  "noop" ];
										add: (TypInfNextEdge origin: edge origin target: e target) ]
								ifNone: [  "noop" ] ] ] ].
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
								text: self type asString , String lf , node formattedCode;
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
	| edges nodes currentNodes nextNodes |
	currentNodes := aMondrian existingNodes.
	nodes := "(context outEdges collect: #target)
			, "(context nodes values flatCollect: #yourself) difference: currentNodes.
	nodes ifEmpty: [ ^ self ].
	nextNodes := currentNodes , nodes , {self}.
	edges := (((nodes flatCollect: #inEdges)
			select: [ :e | nextNodes includes: e origin ])
			, ((nodes flatCollect: #outEdges) select: [ :e | nextNodes includes: e target ]))
			asIdentitySet groupedBy: [ :e | e key -> e nodes ].
	nodes := (edges keys flatCollect: #value) asIdentitySet
			difference: currentNodes.
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
