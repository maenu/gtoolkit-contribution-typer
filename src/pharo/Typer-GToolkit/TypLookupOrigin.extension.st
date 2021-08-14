Extension { #name : #TypLookupOrigin }

{ #category : #'*Typer-GToolkit' }
TypLookupOrigin >> typGtLookupFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Lookup';
		  priority: 10;
		  stencil: [ GtInspector forObject: lookup ]
]
