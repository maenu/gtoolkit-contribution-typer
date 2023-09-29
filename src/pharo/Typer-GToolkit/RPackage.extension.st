Extension { #name : #RPackage }

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
						  size: 25 @ 25;
						  background: Color blue;
						  yourself ];
				  with: methods.
			  e edges
				  fromNearestBounds;
				  toNearestBounds;
				  shape: [ 
					  BlParabollaArcElement new
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
				  f ast typGtInvokedMethods select: [ :g | methods includes: g ] ].
			  e layout force charge: -5000 ];
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
