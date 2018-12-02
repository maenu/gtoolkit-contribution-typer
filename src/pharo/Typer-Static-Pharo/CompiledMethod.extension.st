Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Static-Pharo' }
CompiledMethod class >> typAsType [
	^ TypNamedType new
		name: self name;
		yourself
]
