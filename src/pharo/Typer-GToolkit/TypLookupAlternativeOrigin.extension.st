Extension { #name : #TypLookupAlternativeOrigin }

{ #category : #'*Typer-GToolkit' }
TypLookupAlternativeOrigin >> typGtAlternativeFor: aView [

	<gtView>
	^ aView forward
		  title: 'Alternatives';
		  priority: 9;
		  object: [ alternatives ];
		  view: #gtItemsFor:
]
