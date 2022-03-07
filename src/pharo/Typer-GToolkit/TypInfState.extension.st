Extension { #name : #TypInfState }

{ #category : #'*Typer-GToolkit' }
TypInfState >> typGtItemsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Index';
		  priority: 10;
		  object: [ self index ];
		  view: #gtItemsFor:
]
