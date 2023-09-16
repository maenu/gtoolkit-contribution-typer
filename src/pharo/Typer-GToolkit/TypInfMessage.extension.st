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
			lookupResolved := lookup resolved.
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
