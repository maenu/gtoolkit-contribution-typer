Extension { #name : #TypNode }

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtAsElementIn: aMondrian [
	^ self
		typGtDecorate: (BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude;
				label: self asString;
				yourself)
		in: aMondrian
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtBorder: aNumber [
	^ BlBorder builder
		paint: (self typGtColor alpha: aNumber);
		width: 1;
		build
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtColor [

	^ Color blue
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtDecorate: anElement in: aMondrian [
	anElement userData at: #typGtNode put: self.
	^ anElement
		when: BlMouseDownEvent do: [ anElement zIndex: 1 ];
		when: BlMouseOverEvent
			do: [ | edges |
				edges := self edges.
				aMondrian topStep root graph edgeChildren
					select: [ :e | edges includes: (e userData at: #typGtEdge) ]
					thenDo: [ :e | 
						(e childNamed: #label) visibility: BlVisibility visible.
						e typGtOnMouseOver ].
				anElement typGtOnMouseOver ];
		when: BlMouseOutEvent
			do: [ | edges |
				edges := self edges.
				aMondrian topStep root graph edgeChildren
					select: [ :e | edges includes: (e userData at: #typGtEdge) ]
					thenDo: [ :e | 
						(e childNamed: #label) visibility: BlVisibility hidden.
						e typGtOnMouseOut ].
				anElement typGtOnMouseOut ];
		when: BlClickEvent do: [ anElement phlow spawnObject: self ];
		addAptitude: (TypGtStrongBorderAptitude color: self typGtColor)
				+ ((BrGlamorousWithTooltipAptitude
						content: [ BrToolbar new
								aptitude: BrGlamorousToolbarAptitude;
								addItem: (BrButton new
										aptitude: BrGlamorousButtonWithLabelAptitude;
										label: ('out {1}' format: {self outEdges size});
										action: [ :button | 
											| nodes existingNodes remainingNodes |
											existingNodes := aMondrian existingNodes.
											nodes := (self outEdges collect: #target) difference: existingNodes.
											remainingNodes := nodes size.
											(nodes asArray takeFirst: 5) do: [ :e | e typGtPaintOn: aMondrian ].
											remainingNodes > nodes size
												ifTrue: [ button
														enable;
														label: ('out {1}' format: {remainingNodes - nodes size}) ]
												ifFalse: [ button
														disable;
														label: 'out' ] ];
										yourself);
								addItem: (BrButton new
										aptitude: BrGlamorousButtonWithLabelAptitude;
										label: ('in {1}' format: {self inEdges size});
										action: [ :button | 
											| nodes existingNodes remainingNodes |
											Halt once.
											existingNodes := aMondrian existingNodes.
											nodes := (self inEdges collect: #origin) difference: existingNodes.
											remainingNodes := nodes size.
											(nodes asArray takeFirst: 5) do: [ :e | e typGtPaintOn: aMondrian ].
											remainingNodes > nodes size
												ifTrue: [ button
														enable;
														label: ('in {1}' format: {remainingNodes - nodes size}) ]
												ifFalse: [ button
														disable;
														label: 'in' ] ];
										yourself);
								yourself ])
						showDelay: 300 milliSeconds;
						hideDelay: 300 milliSeconds;
						yourself);
		yourself
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtGraphFor: aView [

	<gtView>
	^ aView typGtMondrian
		  title: 'Graph';
		  priority: 10;
		  painting: [ :m | self typGtPaintOn: m ]
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtPaintOn: aMondrian [

	| edges nodes currentNodes nextNodes |
	currentNodes := aMondrian existingNodes.
	nodes := self neighbors , { self } difference: currentNodes.
	nodes ifEmpty: [ ^ self ].
	nextNodes := currentNodes , nodes , { self }.
	edges := ((((nodes flatCollect: #inEdges) select: [ :e | 
		            nextNodes includes: e origin ])
	           , ((nodes flatCollect: #outEdges) select: [ :e | 
			            nextNodes includes: e target ]) groupedBy: #nodes)
		          values asIdentitySet asArray sort: [ :a :b | a size > b size ]) 
		         takeFirst: 64.
	nodes := (edges flatCollect: [ :e | e flatCollect: #nodes ]) 
		         difference: currentNodes.
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
