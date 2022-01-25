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
TypNode >> typGtColor [

	^ Color fromHexString: '91d5ff'
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtDecorate: anObject [ 
]

{ #category : #'*Typer-GToolkit' }
TypNode >> typGtDecorate: anElement in: aMondrian [

	anElement
		when: BlMouseDownEvent do: [ anElement zIndex: 1 ];
		when: BlClickEvent do: [ anElement phlow spawnObject: self ].
	anElement addAptitude:
		(TypGtStrongBorderAptitude color: self typGtColor)
		+ ((BrGlamorousWithTooltipAptitude content: [ 
					  BrToolbar new
						  aptitude: BrGlamorousToolbarAptitude;
						  addItem: (BrButton new
								   aptitude: BrGlamorousButtonWithLabelAptitude;
								   label: ('out {1}' format: { outgoing size });
								   action: [ :button | 
									   | nodes existingNodes remainingNodes |
									   existingNodes := aMondrian existingNodes.
									   nodes := (outgoing collect: #target) difference:
											            existingNodes.
									   remainingNodes := nodes size.
									   (nodes asArray takeFirst: 5) do: [ :e | 
											   e typGtPaintOn: aMondrian ].
									   remainingNodes > nodes size
										   ifTrue: [ 
											   button
												   enable;
												   label:
													   ('out {1}' format: { (remainingNodes - nodes size) }) ]
										   ifFalse: [ 
											   button
												   disable;
												   label: 'out' ] ];
								   yourself);
						  addItem: (BrButton new
								   aptitude: BrGlamorousButtonWithLabelAptitude;
								   label: ('in {1}' format: { incoming size });
								   action: [ :button | 
									   | nodes existingNodes remainingNodes |
									   existingNodes := aMondrian existingNodes.
									   nodes := (incoming collect: #origin) difference:
											            existingNodes.
									   remainingNodes := nodes size.
									   (nodes asArray takeFirst: 5) do: [ :e | 
											   e typGtPaintOn: aMondrian ].
									   remainingNodes > nodes size
										   ifTrue: [ 
											   button
												   enable;
												   label:
													   ('in {1}' format: { (remainingNodes - nodes size) }) ]
										   ifFalse: [ 
											   button
												   disable;
												   label: 'in' ] ];
								   yourself);
						  yourself ])
				 showDelay: 300 milliSeconds;
				 hideDelay: 300 milliSeconds;
				 yourself).
	^ anElement
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
	edges := ((((nodes flatCollect: #incoming) select: [ :e | 
		            nextNodes includes: e origin ])
	           , ((nodes flatCollect: #outgoing) select: [ :e | 
			            nextNodes includes: e target ]) groupedBy: #nodes)
		          values asArray sort: [ :a :b | a size > b size ]) 
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
