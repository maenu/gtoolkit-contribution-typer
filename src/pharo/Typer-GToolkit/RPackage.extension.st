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
				with: self classes
				forEach: [ :f |
					e nodes
						stencil: [ :g "typCastAs RGMethodDefinition" | 
							BlElement new
								geometry: BlRectangle new;
								background:
									(g ast
										typType;
										typCheColor);
								constraintsDo: [ :c | 
									(c horizontal "typCastAs BlLayoutCommonConstraintsAxis") exact: 16.
									(c vertical "typCastAs BlLayoutCommonConstraintsAxis") exact: 16 ];
								yourself ];
						with: (((self methodsForClass: f instanceSide) , (self methodsForClass: f classSide)) collect: #asRingDefinition).
					e layout grid ].
			e edges
				fromCenterBottom;
				toCenterTop;
				connectFrom: #superclass.
			e layout tree ];
		yourself
]
