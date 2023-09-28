Extension { #name : #MethodModified }

{ #category : #'*Typer-Inference' }
MethodModified >> typInfInvalidateIndex [
	TypInfIndex instance
		removeMethod: oldMethod;
		addMethod: method
]

{ #category : #'*Typer-Inference' }
MethodModified >> typInfInvalidatesMethod: aLookup [
	^ (super typInfInvalidatesMethod: aLookup)
		or: [ oldMethod sendsSelector: aLookup selector ]
]
