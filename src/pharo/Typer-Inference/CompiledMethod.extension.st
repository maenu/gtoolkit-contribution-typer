Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsMethodLookupResult [
	^ self ast typIsReturnSelf
		ifTrue: [ TypMethodLookupResult new
				resultType: [ :r :a | a receiverType ];
				yourself ]
		ifFalse: [ nil ]
]
