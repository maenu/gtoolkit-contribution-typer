Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsMethodResolver [
	^ self ast typIsReturnSelf
		ifTrue: [ TypMethodResolver new
				argumentTypes: [ TypUnknownType instance ];
				resultType: [ :r :a | a receiverType ];
				signalsAlways: [ nil ];
				yourself ]
		ifFalse: [ TypMethodResolver new
				argumentTypes: [ TypUnknownType instance ];
				resultType: [ TypUnknownType instance ];
				signalsAlways: [ nil ];
				yourself ]
]
