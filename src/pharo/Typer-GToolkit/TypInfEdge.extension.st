Extension { #name : #TypInfEdge }

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtStateFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView forward
		  title: 'State';
		  priority: 10;
		  object: [ state ];
		  view: #gtItemsFor:
]

{ #category : #'*Typer-GToolkit' }
TypInfEdge >> typGtTypeFor: aView [

	<gtView>
	state ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: (state at: origin) ]
]
