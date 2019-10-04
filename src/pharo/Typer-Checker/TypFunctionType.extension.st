Extension { #name : #TypFunctionType }

{ #category : #'*Typer-Checker' }
TypFunctionType >> typCheHasArgumentsCompatibleWithThoseOf: aType [
	<typTypeArgument: 1 as: 'TypFunctionType'>
	<typTypeResultAs: 'Boolean'>
	| size |
	size := optionalArguments
		ifTrue: [ aType arguments size ]
		ifFalse: [ arguments size ].
	^ size = 0
		or: [ size <= arguments size
				and: [ size <= aType arguments size
						and: [ ((arguments copyFrom: 1 to: size)
								withIndexSelect: [ :e :i | e >= (aType arguments at: i) ])
								size = size ] ] ]
]
