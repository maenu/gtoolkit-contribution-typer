Extension { #name : #TypInfNodeSignal }

{ #category : #'*Typer-GToolkit' }
TypInfNodeSignal >> typGtNodeFor: aView [
	<gtView>
	^ aView explicit
		title: 'Node';
		priority: 0;
		stencil: [ GtInspectorTool forObject: node ]
]

{ #category : #'*Typer-GToolkit' }
TypInfNodeSignal >> typGtStackFor: aView [
	<gtView>
	^ aView forward
		title: 'Typer Stack';
		priority: 1;
		object: [ self typGtStack ];
		view: #gtItemsFor:
]
