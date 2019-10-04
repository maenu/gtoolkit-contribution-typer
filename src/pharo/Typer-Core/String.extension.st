Extension { #name : #String }

{ #category : #'*Typer-Core' }
String >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ self typAsTypes first
]

{ #category : #'*Typer-Core' }
String >> typAsTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ TypTypeParser parse: self
]
