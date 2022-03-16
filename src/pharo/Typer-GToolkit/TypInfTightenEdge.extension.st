Extension { #name : #TypInfTightenEdge }

{ #category : #'*Typer-GToolkit' }
TypInfTightenEdge >> typGtTypeFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: type ]
]
