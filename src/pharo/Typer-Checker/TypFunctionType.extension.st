Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Checker' }
TypFunctionType >> typCheHasArgumentsCompatibleWithThoseOf: aType [
	<typTypeArgument: 1 as: 'TypFunctionType'>
	<typTypeResultAs: 'Boolean'>
	| size |
	size := argumentsOptional
		ifTrue: [ aType argumentsSize ]
		ifFalse: [ argumentsSize ].
	^ size = 0
		or: [ size <= argumentsSize
				and: [ size <= aType arguments size
						and: [ ((self arguments copyFrom: 1 to: size)
								withIndexSelect: [ :e :i | e >= (aType arguments at: i) ])
								size = size ] ] ]
]
