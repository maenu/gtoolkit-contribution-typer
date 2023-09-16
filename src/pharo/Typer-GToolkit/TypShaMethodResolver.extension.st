Extension { #name : #TypShaMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtExpanderMethod: aLookup [
	| methodClass |
	methodClass := aLookup receiver classDescription.
	^ aLookup receiver classDescription
		>> (TypShaIndex instance
				methodResolvers: methodClass
				selector: aLookup selector) anyOne
]

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtIndicator [
	^ 's'
]
