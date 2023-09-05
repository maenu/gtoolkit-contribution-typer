Extension { #name : #TypMethodLookup }

{ #category : #'*Typer-Inference' }
TypMethodLookup >> typInfContexts [
	^ resolver ifNil: [ {} ] ifNotNil: [ {resolver typInfContext: self} ]
]
