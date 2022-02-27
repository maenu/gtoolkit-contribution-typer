Extension { #name : #TypInfMethodNodeContext }

{ #category : #'*Typer-GToolkit' }
TypInfMethodNodeContext >> typGtFlowFor: aView [

	<gtView>
	^ aView forward
		  title: 'Control Flow';
		  priority: 10;
		  object: [ root ];
		  view: #typGtFlowFor:
]
