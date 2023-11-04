Extension { #name : #TypMethodLookup }

{ #category : #'*Typer-GToolkit' }
TypMethodLookup >> typGtExpanderMethod [
	resolver ifNil: [ ^ self compiledMethod ].
	^ resolver typGtExpanderMethod: self
]

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
