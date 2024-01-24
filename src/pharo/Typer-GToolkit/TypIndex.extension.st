Extension { #name : #TypIndex }

{ #category : #'*Typer-GToolkit' }
TypIndex >> typGtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Items';
		priority: 30;
		object: [ cache ];
		view: #gtItemsFor:
]
