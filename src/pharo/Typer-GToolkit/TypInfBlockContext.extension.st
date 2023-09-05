Extension { #name : #TypInfBlockContext }

{ #category : #'*Typer-GToolkit' }
TypInfBlockContext >> typGtExpander [
	^ TypGtBlockExpanderAttribute inContext: self
]
