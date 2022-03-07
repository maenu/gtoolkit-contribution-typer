Extension { #name : #TypInfWrappingState }

{ #category : #'*Typer-GToolkit' }
TypInfWrappingState >> typGtSelfItemsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Self Index';
		  priority: 10;
		  object: [  index ];
		  view: #gtItemsFor:
]
