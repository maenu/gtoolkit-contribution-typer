Extension { #name : #TypShaMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtExpanderMethod: aLookup [
	^ TypShaIndex instance cache
		typAt: {#method.
				aLookup resolve receiver classDescription.
				aLookup selector}
]

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtIndicator [
	^ 's'
]
