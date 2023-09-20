Extension { #name : #TypInfInlLookupContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtAsCoder [
	root lookup ifNil: [ ^ {} ].
	^ root lookup resolved typGtAsCoder
]

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtHasCoder [
	^ root lookup isNotNil
]
