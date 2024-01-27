Extension { #name : #TypPropertyLookup }

{ #category : #'*Typer-GToolkit' }
TypPropertyLookup class >> typGtNonFunctionItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Non-function items';
		priority: -101;
		object: [ (index associations reject: [ :e | e key isFunction ]) as: index species ];
		view: #gtItemsFor:
]
