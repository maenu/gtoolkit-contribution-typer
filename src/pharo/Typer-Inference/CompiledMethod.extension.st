Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Inference' }
CompiledMethod >> typInfAsMethodLookupResult [
	^ self ast typIsReturnSelf
		ifTrue: [ TypMethodLookupResult new
				resultType: [ :r :a | a receiverType ];
				yourself ]
		ifFalse: [ (self method isAbstract)
				ifTrue: [ nil ]
				ifFalse: [ | lastIsReturn types |
					lastIsReturn := self ast lastIsReturn.
					types := self ast typReturnNodes collect: #typType.
					TypMethodLookupResult new
						resultType: [ :r :a | 
							lastIsReturn
								ifTrue: [ types typAsType ]
								ifFalse: [ (types , {a receiverType}) typAsType ] ];
						yourself ] ]
]
