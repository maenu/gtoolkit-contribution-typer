Extension { #name : #String }

{ #category : #'*Typer-Static-Pharo' }
String class >> typAsType [
	^ TypNamedType new
		name: self name;
		yourself
]
