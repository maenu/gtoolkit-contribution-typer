Extension { #name : #TypInfMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypInfMethodResolver >> typGtExpanderMethod: aLookup [
	^ aLookup receiver classDescription >> aLookup selector
]

{ #category : #'*Typer-GToolkit' }
TypInfMethodResolver >> typGtIndicator [
	^ 'i'
]
