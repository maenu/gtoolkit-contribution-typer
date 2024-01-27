Extension { #name : #TypLookup }

{ #category : #'*Typer-GToolkit' }
TypLookup class >> typGtIndexFor: aView [
	<gtView>
	<gtClassView>
	index ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Index';
		priority: -1;
		object: [ index ];
		view: #gtItemsFor:
]

{ #category : #'*Typer-GToolkit' }
TypLookup >> typGtIndicator [
	"i for inlined, has no resolver"

	^ resolver ifNil: 'i' ifNotNil: #typGtIndicator
]
