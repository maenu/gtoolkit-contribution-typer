Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Checker' }
RBReturnNode >> typCheCheckCompatibility [
	| expected actual |
	expected := self methodNode typResultType.
	actual := self value typType.
	(expected isUnknown or: [ actual isUnknown ])
		ifTrue: [ ^ self ].
	(expected isNullable and: [ actual isNil ])
		ifTrue: [ ^ self ].
	expected >= actual asNonNullable
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
							functions anySatisfy: [ :e | e typCheHasArgumentsCompatibleWithThoseOf: (actual "typCastAs TypFunctionType") ] ] ] ])
		ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]

{ #category : #'*Typer-Checker' }
RBReturnNode >> typCheCheckNullables [
	| expected actual |
	expected := self methodNode typResultType.
	actual := self value typType.
	(expected isUnknown
		or: [ actual isUnknown
				or: [ actual isNullable not or: [ expected >= actual ] ] ])
		ifTrue: [ ^ self ].
	TypCheNullableTypeError new
		type: actual;
		signal
]
