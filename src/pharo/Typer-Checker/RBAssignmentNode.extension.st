Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Checker' }
RBAssignmentNode >> typCheCheckCompatibility [

	| expected actual |
	expected := self variable typInfTypeSelf.
	actual := self value typInfTypeSelf.
	(expected isUnknown or: [ actual isUnknown ]) ifTrue: [ ^ self ].
	expected >= actual ifTrue: [ ^ self ].
	(actual isFunction and: [ 
		 self value isBlock and: [ 
			 | block |
			 block := self value. "typCastAs RBBlockNode"
			 (block typInfTypeSelf signalsAlways = true or: [ 
				  block body lastIsReturn ]) and: [ 
				 | functions |
				 functions := expected isUnion
					              ifTrue: [ 
						              expected types select: [ :e | "typCastAs TypUnionType" "typParameters TypFunctionType" 
							              e isFunction ] ]
					              ifFalse: [ 
						              expected isFunction
							              ifTrue: [ { expected } ]
							              ifFalse: [ {  } "typParameters TypFunctionType" ] ].
				 functions anySatisfy: [ :e | 
					 e typCheHasArgumentsCompatibleWithThoseOf: actual "typCastAs TypFunctionType" ] ] ] ]) 
		ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]
