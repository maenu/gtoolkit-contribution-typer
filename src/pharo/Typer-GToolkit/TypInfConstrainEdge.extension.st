Extension { #name : #TypInfConstrainEdge }

{ #category : #'*Typer-GToolkit' }
TypInfConstrainEdge >> typGtTypeFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: type ]
]
