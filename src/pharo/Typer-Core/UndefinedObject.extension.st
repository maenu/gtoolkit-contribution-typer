Extension { #name : #UndefinedObject }

{ #category : #'*Typer-Core' }
UndefinedObject class >> typAsType [
	<typTypeResultAs: 'TypNilType'>
	^ TypNilType new
		addOrigin:
			(TypDescriptionOrigin
				description: 'created from special UndefinedObject class>>#typAsType');
		yourself
]
