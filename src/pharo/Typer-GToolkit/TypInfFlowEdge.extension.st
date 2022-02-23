Extension { #name : #TypInfFlowEdge }

{ #category : #'*Typer-GToolkit' }
TypInfFlowEdge >> typGtStateFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView forward
		  title: 'State';
		  priority: 10;
		  object: [ state ];
		  view: #gtItemsFor:
]
