Extension { #name : #TypInfInlMethodResolver }

{ #category : #'*Typer-Shadow-GToolkit' }
TypInfInlMethodResolver >> typGtExpanderMethod: aLookup [
	^ aLookup receiver classDescription >> aLookup selector
]
