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
	contexts
		ifEmpty: [ | lookupResolved |
			lookupResolved := lookup asDefault resolved.
			lookupResolved resolver ifNil: [ ^ {} ].
			^ {GtPharoMethodCoder new
					attributeNamed: #typGtLookup put: lookupResolved;
					forMethod: (lookupResolved resolver typGtExpanderMethod: lookupResolved);
					asCoderViewModel} ].
	^ contexts
		select: [ :a | a value typGtHasCoder ]
		thenCollect: [ :a | 
			| model |
			model := a value typGtAsCoder.
			model coderModel attributeNamed: #typGtLookup put: a key.
			model ]
]

{ #category : #'*Typer-GToolkit' }
TypInfMessage >> typGtInvokedMethods [
	| receiverType |
	receiverType := self receiver.
	(receiverType isNamed and: [ receiverType hasClassDescription ])
		ifFalse: [ ^ #() ].
	^ receiverType classDescription
		classAndMethodFor: self selector value
		do: [ :c :m | {m} ]
		ifAbsent: [ #() ]
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
