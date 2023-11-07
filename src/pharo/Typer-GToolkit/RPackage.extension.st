Extension { #name : #RPackage }

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtCovFor: aView context: aDictionary [
	<gtPackageView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren: {BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: 'methods';
							yourself.
						self typGtCovMethod typGtCovAsElement.
						BrLabel new
							aptitude: BrGlamorousLabelAptitude;
							text: 'nodes';
							yourself.
						self typGtCovNode typGtCovAsElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtCovMethod [
	^ (self methods
		groupedBy: [ :e | 
			ASTCache default
				at: e
				ifPresent: [ :f | f propertyAt: #tagExecuted ifAbsent: [ nil ] ]
				ifAbsent: [ nil ] ]) asDictionary
]

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtCovNode [
	^ ((self methods flatCollect: [ :e | e ast allChildren , {e ast} ])
		groupedBy: [ :e | e propertyAt: #tagExecuted ifAbsent: [ nil ] ])
		asDictionary
]

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtView2For: aView [
	<gtView>
	<typPraResult: 'GtPhlowProtoView'>
	<typPraArguments: 'GtPhlowProtoView'>
	^ aView mondrian
		title: 'Typer2' translated;
		priority: 51;
		painting: [ :m | 
			| methods |
			methods := self methods asSet.
			m nodes
				stencil: [ :f | 
					BlElement new
						size: 25 @ 25;
						background: Color blue;
						yourself ];
				with: methods.
			m edges
				fromNearestBounds;
				toNearestBounds;
				shape: [ BlParabollaArcElement new
						curvatureFraction: 0.2;
						border: (BlBorder paint: (Color gray alpha: 0.5) width: 5);
						toHead: (BlArrowheadSimpleArrow new
								arrowLengthFraction: 3;
								arrowNoseAngle: 60;
								border: (BlBorder paint: (Color gray alpha: 0.5) width: 5);
								yourself);
						yourself ];
				connect: methods
					toAll: [ :f | 
						((TypInfContextLookup
							node: f ast
							arguments: f selector typInfUnknownArguments
							self: f methodClass typAsType
							super: f methodClass typAsType superOrNil) resultAsyncFor: 1 second) wait
							select: [ :g | methods includes: g ] ] ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtViewFor: aView [
	<gtView>
	<typPraResult: 'GtPhlowProtoView'>
	<typPraArguments: 'GtPhlowProtoView'>
	^ aView mondrian
		title: 'Typer' translated;
		priority: 50;
		painting: [ :e | 
			| classes_ |
			classes_ := (self classes collect: #instanceSide) asSet.
			e nodes
				stencil: [ :f | f typGtElementInPackage: self ];
				with: classes_.
			e edges
				connectTo: [ :f | 
					f allSuperclasses
						detect: [ :g | classes_ includes: g ]
						ifNone: [ nil ] ].
			e layout force charge: -5000 ];
		actionUpdateButton;
		yourself
]
