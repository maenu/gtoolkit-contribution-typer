Extension { #name : #SystemAnnouncement }

{ #category : #'*Typer-Core' }
SystemAnnouncement >> typInvalidateAll [
	((self class methods
		select: [ :m | m hasPragmaNamed: #typInvalidate: ]
		thenCollect: [ :m | m selector -> (m pragmaAt: #typInvalidate:) arguments first ])
		asOrderedCollection sort: [ :a :b | a value < b value ])
		do: [ :a | self perform: a key ]
]
