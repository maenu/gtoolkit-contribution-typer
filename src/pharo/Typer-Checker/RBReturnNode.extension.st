Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Checker' }
RBReturnNode >> typCheCheckCompatibility [
	| expected actual |
	expected := self methodNode typTypeForResult.
	actual := self value typType.
	(expected isUnknown or: [ actual isUnknown ])
		ifTrue: [ ^ self ].
	expected >= actual
		ifTrue: [ ^ self ].
	(actual isFunction
		and: [ self value isBlock
				and: [ | block |
					block := self value "typCastAs RBBlockNode".
					(block body typSignalsAlways = true
						or: [ block body lastIsReturn ])
						and: [ | functions |
							functions := expected isUnion
								ifTrue:
									[ ((expected "typCastAs TypUnionType") types select: [ :e | e isFunction ]) "typParameters TypFunctionType" ]
								ifFalse: [ expected isFunction
										ifTrue: [ {expected "typCastAs TypFunctionType"} ]
										ifFalse: [ {} "typParameters TypFunctionType" ] ].
							functions anySatisfy: [ :e | e hasParametersCompatibleWithThoseOf: (actual "typCastAs TypFunctionType") ] ] ] ])
		ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]
