Extension { #name : #Collection }

{ #category : #'*Typer-Core' }
Collection >> typAsType [

	^ self asIdentitySet typAsType
]
