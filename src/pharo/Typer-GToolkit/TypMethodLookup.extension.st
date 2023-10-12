Extension { #name : #TypMethodLookup }

{ #category : #'*Typer-GToolkit' }
TypMethodLookup >> typGtMethodFor: aView [
	<gtView>
	^ self compiledMethod
		ifNil: [ aView empty ]
		ifNotNil: [ :m | 
			aView forward
				title: 'Method';
				priority: 10;
				object: [ m ];
				view: #gtSourceCodeFor: ]
]
