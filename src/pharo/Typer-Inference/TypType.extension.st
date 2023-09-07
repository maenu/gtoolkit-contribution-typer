Extension { #name : #TypType }

{ #category : #'*Typer-Inference' }
TypType >> typInfCanResolveMethod: aLookup [
	^ (TypDepthFirstResolver resolver: TypInfMethodResolver instance)
		canResolve: aLookup
]

{ #category : #'*Typer-Inference' }
TypType >> typInfHasNode [
	^ false
]

{ #category : #'*Typer-Inference' }
TypType >> typInfWithoutUnion [

	^ self
]

{ #category : #'*Typer-Inference' }
TypType >> typInfWithoutUnknown [

	^ self
]
