Extension { #name : #TypShaMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtExpanderMethod: aLookup [
	^ (TypShaIndex instance cache
		typAt: {#method.
				aLookup receiver classDescription.
				aLookup selector}) anyOne
]

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtIndicator [
	^ 's'
]
