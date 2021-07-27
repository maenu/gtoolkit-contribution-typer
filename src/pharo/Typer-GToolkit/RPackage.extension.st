Extension { #name : #RPackage }

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtCoverageFor: aView context: aDictionary [
	<gtPackageView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren:
					{(BrLabel new
						look: BrGlamorousLabelLook;
						text: 'methods';
						yourself).
					self typGtMethodCoverage typGtAsCoverageElement.
					(BrLabel new
						look: BrGlamorousLabelLook;
						text: 'nodes';
						yourself).
					self typGtNodeCoverage typGtAsCoverageElement};
				yourself ];
		yourself
]

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtMethodCoverage [
	^ (self methods
		groupedBy: [ :e | 
			ASTCache default
				at: e
				ifPresent: [ :f | f propertyAt: #tagExecuted ifAbsent: [ nil ] ]
				ifAbsent: [ nil ] ]) asDictionary
]

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtNodeCoverage [
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
		  painting: [ :e | 
			  | methods |
			  methods := self methods asSet.
			  e nodes
				  stencil: [ :f | 
					  BlElement new
						  geometry: BlCircle new;
						  size: 25 @ 25;
						  background: Color blue;
						  yourself ];
				  with: methods.
			  e edges
				  shape: [ 
					  BlParabollaArcElement new
						  curvatureFraction: 0.2;
						  border: (BlBorder paint: (Color gray alpha: 0.5) width: 25);
						  toHead: (BlArrowheadSimpleArrow new
								   arrowLengthFraction: 25;
								   arrowNoseAngle: 60;
								   border: (BlBorder paint: (Color gray alpha: 0.5) width: 25);
								   yourself);
						  yourself ];
				  connect: methods toAll: [ :f | 
				  TypInfSelf
					  value: f methodClass typAsType
					  during: [ 
					  f ast typGtInvokedMethods select: [ :g | methods includes: g ] ] ].
			  e layout circle ];
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
		yourself
]
