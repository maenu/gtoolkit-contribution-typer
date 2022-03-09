Extension { #name : #TypInfWrappingState }

{ #category : #'*Typer-GToolkit' }
TypInfWrappingState >> typGtSelfItemsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Self Index';
		  priority: 9;
		  object: [  index ];
		  view: #gtItemsFor:
]
