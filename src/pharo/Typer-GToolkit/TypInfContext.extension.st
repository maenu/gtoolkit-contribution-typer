Extension { #name : #TypInfContext }

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtFlowFor: aView [

	<gtView>
	^ aView forward
		  title: 'Control Flow';
		  priority: 10;
		  object: [ root ];
		  view: #typGtFlowFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfContext >> typGtStateFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView forward
		  title: 'State';
		  priority: 10;
		  object: [ state ];
		  view: #typGtItemsFor:
]
