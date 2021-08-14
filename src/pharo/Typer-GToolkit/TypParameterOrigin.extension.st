Extension { #name : #TypParameterOrigin }

{ #category : #'*Typer-GToolkit' }
TypParameterOrigin >> typGtTypeFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Type';
		  priority: 10;
		  stencil: [ GtInspector forObject: type ]
]
