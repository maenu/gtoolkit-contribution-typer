Extension { #name : #TypInfInlineContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlineContext >> typGtIndicator: aLookup [
	^ 'i:' , aLookup resolver typGtIndicator
]
