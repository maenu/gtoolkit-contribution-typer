Extension { #name : #TypInfFlowAnalysis }

{ #category : #'*Typer-GToolkit' }
TypInfFlowAnalysis >> typGtFlowFor: aView [

	<gtView>
	^ aView forward
		  title: 'Control Flow';
		  priority: 10;
		  object: [ root ];
		  view: #typGtFlowFor:
]
