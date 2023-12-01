Extension { #name : #TypInfMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypInfMethodResolver >> typGtExpanderMethod: aLookup [
	^ aLookup resolve compiledMethod
]

{ #category : #'*Typer-GToolkit' }
TypInfMethodResolver >> typGtIndicator [
	^ 'i'
]
