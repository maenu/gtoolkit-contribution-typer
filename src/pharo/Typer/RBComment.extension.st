Extension { #name : #RBComment }

{ #category : #'*Typer' }
RBComment >> typCastAs [
	<typTypeResultAs: 'TypType'>
	self assert: [ self typIsCastAs ].
	^ (self contents copyFrom: 'typCastAs ' size + 1 to: self contents size) typAsType
]

{ #category : #'*Typer' }
RBComment >> typIsCastAs [
	<typTypeResultAs: 'Boolean'>
	^ self contents beginsWith: 'typCastAs '
]

{ #category : #'*Typer' }
RBComment >> typIsParameters [
	<typTypeResultAs: 'Boolean'>
	^ self contents beginsWith: 'typParameters '
]

{ #category : #'*Typer' }
RBComment >> typParameters [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	self assert: [ self typIsParameters ].
	^ (self contents copyFrom: 'typParameters ' size + 1 to: self contents size) typAsTypes
]
