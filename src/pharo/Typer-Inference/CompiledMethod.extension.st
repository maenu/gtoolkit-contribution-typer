Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsMethodResolver [
	^ self ast typIsReturnSelf
		ifTrue: [ TypMethodLookupResult new
				argumentTypes: [ TypUnknownType instance ];
				resultType: [ :r :a | a receiverType ];
				signalsAlways: [ nil ];
				yourself ]
		ifFalse: [ TypMethodLookupResult new
				argumentTypes: [ TypUnknownType instance ];
				resultType: [ TypUnknownType instance ];
				signalsAlways: [ nil ];
				yourself ]
]
