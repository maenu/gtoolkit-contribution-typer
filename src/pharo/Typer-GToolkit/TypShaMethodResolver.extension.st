Extension { #name : #TypShaMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtExpanderMethod: aLookup [
	^ aLookup receiver classDescription
		>> (TypShaIndex instance resolveMethod: aLookup) anyOne selector
]

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtIndicator [
	^ 's'
]
