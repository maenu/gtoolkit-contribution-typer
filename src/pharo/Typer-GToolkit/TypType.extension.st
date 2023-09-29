Extension { #name : #TypType }

{ #category : #'*Typer-GToolkit' }
TypType class >> gtIndexFor: aView [
	<gtView>
	^ aView forward
		title: 'Index';
		priority: -2;
		object: [ index ];
		view: #gtItemsFor:
]
