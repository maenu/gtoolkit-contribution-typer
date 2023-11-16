Extension { #name : #TypInfState }

{ #category : #'*Typer-GToolkit' }
TypInfState >> typGtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Cache';
		priority: -1;
		object: [ self last ];
		view: #gtItemsFor:
]
