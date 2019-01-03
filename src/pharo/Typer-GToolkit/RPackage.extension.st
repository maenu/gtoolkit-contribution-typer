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
				stencil: [ :f "typCastAs CompiledMethod<Integer>" | 
					BlElement new
						geometry: BlRectangle new;
						background:
							(f ast
								typType;
								typCheColor);
						constraintsDo: [ :c | 
							(c horizontal "typCastAs BlLayoutCommonConstraintsAxis") exact: 16.
							(c vertical "typCastAs BlLayoutCommonConstraintsAxis") exact: 16 ];
						yourself ];
				with: self methods.
			e layout grid ];
		yourself
]
