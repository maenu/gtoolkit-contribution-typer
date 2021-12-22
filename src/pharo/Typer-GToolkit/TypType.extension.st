Extension { #name : #TypType }

{ #category : #'*Typer-GToolkit' }
TypType class >> gtClassIndexFor: aView [

	<gtClassView>
	^ aView forward
		  title: 'Index';
		  priority: 10;
		  object: [ index ];
		  view: #gtItemsFor:
]

{ #category : #'*Typer-GToolkit' }
TypType class >> gtIndexFor: aView [

	<gtView>
	^ aView forward
		  title: 'Index';
		  priority: -2;
		  object: [ index ];
		  view: #gtItemsFor:
]
