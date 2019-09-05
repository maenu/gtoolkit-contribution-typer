Extension { #name : #SequenceableCollection }

{ #category : #'*Typer' }
SequenceableCollection >> typAsIterator [
	^ TypSequenceableCollectionIterator new
		collection: self;
		yourself
]
