Extension { #name : #TypLookup }

{ #category : #'*Typer-GToolkit' }
TypLookup >> typGtIndicator [
	"i for inlined, has no resolver"

	^ resolver ifNil: 'i' ifNotNil: #typGtIndicator
]

{ #category : #'*Typer-GToolkit' }
TypLookup class >> typGtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Items';
		priority: -100;
		object: [ index ];
		view: #gtItemsFor:
]

{ #category : #'*Typer-GToolkit' }
TypLookup class >> typGtNonFunctionItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Non-function items';
		priority: -101;
		object: [ (index associations reject: [ :e | e key isFunction ]) as: index species ];
		view: #gtItemsFor:
]
