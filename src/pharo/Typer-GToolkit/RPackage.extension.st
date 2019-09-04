Extension { #name : #RPackage }

{ #category : #'*Typer-GToolkit' }
RPackage >> typGtViewFor: aView [
	<gtView>
	<typTypeArgument: 1 as: 'GtPhlowProtoView'>
	<typTypeResultAs: 'GtPhlowProtoView'>
	^ aView mondrian
		title: 'Typer' translated;
		priority: 50;
		painting: [ :e | 
			e nodes
				stencil: [ :f | f typGtElementInPackage: self ];
				with: (self classes collect: #instanceSide) asSet.
			e edges
				fromCenterBottom;
				toCenterTop;
				connectFrom: #superclass.
			e layout tree ];
		yourself
]
