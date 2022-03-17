Extension { #name : #TypInfNextEdge }

{ #category : #'*Typer-GToolkit' }
TypInfNextEdge >> typGtColor [

	^ Color blue alpha: 0.3
]

{ #category : #'*Typer-GToolkit' }
TypInfNextEdge >> typGtStateFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView forward
		  title: 'State';
		  priority: 10;
		  object: [ state ];
		  view: #typGtItemsFor:
]
