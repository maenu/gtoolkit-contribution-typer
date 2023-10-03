Extension { #name : #TypUnionType }

{ #category : #'*Typer-GToolkit' }
TypUnionType >> typGtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Types';
		priority: 10;
		object: [ types ];
		view: #gtItemsFor:
]
