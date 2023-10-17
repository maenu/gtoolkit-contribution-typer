Extension { #name : #TypInfMessage }

{ #category : #'*Typer-GToolkit' }
TypInfMessage >> typGtAsShortString [
	^ 'mes'
]

{ #category : #'*Typer-GToolkit' }
TypInfMessage >> typGtColor [
	^ BrGlamorousColors defaultButtonTextColor
]

{ #category : #'*Typer-GToolkit' }
TypInfMessage >> typGtExpanderCoders [
	^ contexts
		select: [ :a | a value typGtHasCoder ]
		thenCollect: [ :a | 
			| model |
			model := a value typGtAsCoder.
			model coderModel attributeNamed: #typGtLookup put: a key.
			model ]
]

{ #category : #'*Typer-GToolkit' }
TypInfMessage >> typGtShaCanType [
	self receiver isNamed ifFalse: [ ^ false ].
	^ self receiver hasClassDescription
]

{ #category : #'*Typer-GToolkit' }
TypInfMessage >> typGtShaMethod [
	| type |
	self assert: [ self typGtShaCanType ].
	type := self type.
	^ self receiver classDescription typGtShaMethod: self selector type: type
]
