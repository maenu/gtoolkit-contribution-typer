Extension { #name : #TypShaMethodResolver }

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtExpanderMethod: aLookup [
	| methodClass |
	methodClass := aLookup receiver classDescription.
	^ aLookup receiver classDescription
		>> (TypShaMethodIndex instance
				methodResolvers: methodClass
				selector: aLookup selector) anyOne
]

{ #category : #'*Typer-GToolkit' }
TypShaMethodResolver >> typGtIndicator [
	^ 's'
]
