Extension { #name : #TypInfNodeSignal }

{ #category : #'*Typer-GToolkit' }
TypInfNodeSignal >> typGtNodeFor: aView [
	<gtView>
	^ aView explicit
		title: 'Node';
		priority: 0;
		stencil: [ GtInspectorTool forObject: node ]
]
