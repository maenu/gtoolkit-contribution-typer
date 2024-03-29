Extension { #name : #String }

{ #category : #'*Typer-Core' }
String >> typAsType [
	<typPraResult: 'TypType'>
	^ self typAsTypes first
]

{ #category : #'*Typer-Core' }
String >> typAsTypes [
	<typPraResult: 'SequenceableCollection<TypType>'>
	^ TypTypeParser parse: self
]
